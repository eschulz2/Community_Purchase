class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = params[:price].to_i * 100
    @description = params[:description]
    @table_id = params[:table_id]
    @email = params[:stripeEmail]
    table = Table.find(@table_id)

    if table.purchased == false

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

      table.purchased = true
      table.save
      flash[:notice] = "Booked!"
      redirect_to :root

    else
      flash[:alert] = "Failure since that spot was just sold moments ago!"
      redirect_to :root
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to :root

  end

end