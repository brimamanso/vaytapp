class CustsController < ApplicationController

    before_action :authenticate_user!

    def index
      @Custs = Cust.all.order('updated_at DESC')
    end

    def create
        if Cust.between(params[:sender_id],params[:recipient_id]).present?
            @cust = Cust.between(params[:sender_id], params[:recipient_id]).first
        else
            @cust = Cust.create!(cust_params)
        end
        redirect_to cust_msges_path(@cust)
    end

    private
    
    def cust_params
        params.permit(:sender_id, :recipient_id)
    end
end
