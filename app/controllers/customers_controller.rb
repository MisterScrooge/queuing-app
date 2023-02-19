class CustomersController < ApplicationController
    before_action :set_customer, only: [ :serve, :done_serve ]

    def index
        @customers = Customer.all
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        @customer.queued_at = Date.current
        @customer.queuing_number = Customer.count + 1

        if @customer.save
            redirect_to customers_path, notice: "Thank you for queuing!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def serve
        @customer.update(is_served: true)
        redirect_to customers_path
    end

    def done_serve
        @customer.update(served_at: Date.current)
        redirect_to customers_path
    end

    private
        def set_customer
            @customer = Customer.find_by(id: params[:id])
        end

        def customer_params
            params.require(:customer).permit(:customer_name, :mobile_number, :pax)
        end
end
