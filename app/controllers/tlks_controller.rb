class TlksController < ApplicationController 
    before_action :authenticate_user!

    def index
        @tlks = Tlk.all.order('updated_at DESC')
    end

    def create
        if Tlk.between(params[:sender_id],params[:recipient_id]).present?
            @tlk = Tlk.between(params[:sender_id], params[:recipient_id]).first
        else
            @tlk = Tlk.create!(tlk_params)
        end
        redirect_to tlk_mls_path(@tlk)
    end

    private
    def tlk_params
        params.permit(:sender_id, :recipient_id)
    end
  
end
