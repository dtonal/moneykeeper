module Api
  class BudgetsController < Api::BaseController
    def index
      @budget = Budget.order("created_at").last
      render :json => @budget.to_json
    end


    def create
      @budget = Budget.new(budget_params)
      if @budget.save
        render :json => @budget.to_json
      else
        render nothing: true, status: :bad_request
      end
    end


    private
    def budget_params
      params.permit(:value)
    end
  end
end
