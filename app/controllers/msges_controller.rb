class MsgesController < ApplicationController

    before_action do
        @cust = Cust.find(params[:cust_id])
    end
    
    def index
        @msges = @cust.msges  
        @msge = @cust.msges.new
    end
    
    def new
        @msge = @cust.msges.new
    end
    
    def create
        @msge = @cust.msges.new(msge_params)
        if @msge.save
          redirect_to cust_msges_path(@cust)
        end
    end
    
    private
    def msge_params
        params.require(:msge).permit(:body, :user_id)
    end
end
