class CardsController < ApplicationController
  require 'payjp'

  # TODO:show画面作成 20191118 伊藤
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def create
    Payjp.api_key = 'sk_test_919b62f881f1b980ae931d18'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'],)
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save!
        redirect_to action: "show"
      else
        redirect_to action: "create"
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
    @cards = Card.where(user_id: current_user.id)
    if @cards.empty?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_919b62f881f1b980ae931d18'
      @cards_infos = {}
      @cards.each do |card|
        customer = Payjp::Customer.retrieve(card.customer_id)
        default_card_information = customer.cards.retrieve(card.card_id)
        @cards_infos[card] = default_card_information
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end
