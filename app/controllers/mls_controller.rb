class MlsController < ApplicationController
    before_action do
        @tlk = Tlk.find(params[:tlk_id])
    end
    
    def index
        @mls = @tlk.mls  
        @ml = @tlk.mls.new
    end
    
    def new
        @ml = @tlk.mls.new
    end
    
    def create
        @ml = @tlk.mls.new(ml_params)
        if @ml.save
          redirect_to tlk_mls_path(@tlk)
        end
    end
    
    private
    def ml_params
        params.require(:ml).permit(:body, :user_id)
    end
end