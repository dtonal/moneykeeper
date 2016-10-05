module Api
  class CostsController < Api::BaseController
    def index
      @costs = Cost.all
      puts "costs.count = #{@costs.count}"
      render :json => @costs.to_json
    end


    def create
      @cost = Cost.new(cost_params)
      @cost.user_id = @current_user.id
      if @cost.save
        render :json => @cost.to_json
      else
        render nothing: true, status: :bad_request
      end
    end


      def destroy
        @cost = Cost.find(params[:id])
        @cost.destroy
        render :json => {:message => "Success"}, status: :ok
      end


    private
    def cost_params
      params.require(:cost).permit(:price, :store, :comment)
    end
  end
end
