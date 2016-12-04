class ChargesController < ApplicationController

	def new
		@project = params[:project]
	end

	def create
		@project = Project.find(params[:project])
		@project.update(published: true)
		@amount = params[:amount]

	  @amount = @amount.gsub('$', '').gsub(',', '')

	  begin
	    @amount = Float(@amount).round(2)
	  rescue
	    flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
	    redirect_to new_charge_path
	    return
	  end

	  @amount = (@amount * 100).to_i # Must be an integer!

	 	customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => "donation for #{@project.name}",
	    :currency    => 'cad'
	  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  flash[:notice] = "Your donation of #{@amount} for #{@project.name} has been received"
		  redirect_to all_projects_path
	end

end
