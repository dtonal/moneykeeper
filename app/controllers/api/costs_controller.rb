module Api
  class CostsController < Api::BaseController
    def index
      @costs = Cost.all
      puts "costs.count = #{@costs.count}"
      render :json => @costs.to_json
    end

  end
end
