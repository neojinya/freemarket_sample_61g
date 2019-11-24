class CardsController < ApplicationController
  require 'payjp'

  def new
    gon.payjp_key = ENV["PAY_JP_TEST_PK"]
    redirect_to action: "show" if current_user.cards.exists?
  end

  def create
    unless params['payjp-token']
      redirect_to action: "new" 
      flash[:notice] = 'カードの登録に失敗しました。'
      
      return
    end
    Payjp.api_key = ENV["PAY_JP_TEST_SK"]
    customer = Payjp::Customer.create(card: params['payjp-token'])
    card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if card.save
      redirect_to action: "show"
      flash[:notice] = 'カードを登録しました。'
    else
      redirect_to action: "new"
      flash[:notice] = 'カードの登録に失敗しました。'
    end
  end

  def show
    @cards = current_user.cards
    if @cards.empty?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAY_JP_TEST_SK"]
      @cards_infos = {}
      @cards.each do |card|
        customer = Payjp::Customer.retrieve(card.customer_id)
        default_card_information = customer.cards.retrieve(card.card_id)
        @cards_infos[card] = default_card_information
      end
    end
  end

  def pay
    card = current_user.cards.first
    if card
      product = Product.find(params[:product][:id])
      Payjp.api_key = ENV["PAY_JP_TEST_SK"]
      charge = Payjp::Charge.create(
        amount: product.price,
        customer: card.customer_id,
        currency: 'jpy'
        )
      if product.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "products", action: 'show',id: product.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "products", action: 'show',id: product.id
      end
    else
      flash[:alert] = 'クレジットカードを登録してください。'
      render :new
    end
  end

end
