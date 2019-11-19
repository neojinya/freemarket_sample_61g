class CardsController < ApplicationController
  require 'payjp'

  def new
    gon.payjp_key = ENV["PAY_JP_TEST_PK"]
    redirect_to action: "show" if current_user.cards.exists?
  end

  def create
    Payjp.api_key = ENV["PAY_JP_TEST_SK"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if card.save
        redirect_to action: "show"
        flash[:notice] = 'カードを登録しました。'
      else
        redirect_to action: "create"
        flash[:notice] = 'カードの登録に失敗しました。'
      end
    end
  end

  # def delete
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #   redirect_to "new"
  # end

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
end
