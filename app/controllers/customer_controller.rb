class CustomerController < ApplicationController
    def index
        @customers = Customer.all
    end

    def new
    end

    def create
        @customer = customer.build(customer_params)

        if @customer.save
            redirect_to customers_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def set_customer
            @customer = customer.find_by(id: params[:id])
        end

        def customer_params
            params.require(:customer).permit(:customer)
        end
end
