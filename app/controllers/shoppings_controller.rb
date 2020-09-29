class ShoppingsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index

  def index
    @shopping = ShoppingAddress.new
    redirect_to root_path if @item.shopping.present?
    redirect_to root_path if @item.user_id == current_user.id
  end

  def create
    @shopping = ShoppingAddress.new(shopping_params)

    if @shopping.valid?
      pay_item
      @shopping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shopping_params
    params.require(:shopping_address).permit(:postal_code, :area_id, :city, :lot_number, :building, :tel_number, :shopping_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
