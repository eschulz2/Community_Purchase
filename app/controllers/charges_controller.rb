class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = params[:price].to_i * 100
    @description = params[:description]
    @table_id = params[:table_id]
    @email = params[:stripeEmail]

    customer = Stripe::Customer.create(
      :email => @email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'usd',
      :receipt_email => @email
    )

    table = Table.find(@table_id)
    table.purchased = true
    table.save
    flash[:notice] = "Booked!"
    redirect_to :root

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :root
  end

end