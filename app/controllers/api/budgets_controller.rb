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

    def getTotalMonthBudgetForDate(requestedDay)
      (Budget.order("created_at").last.value).to_f
    end

    def getMonthBudgetForDate(requestedDay)
      (getDateBudgetForDate(requestedDay) * requestedDay.mday).to_f
    end

    def getWeekBudgetForDate(requestedDay)
      (getDateBudgetForDate(requestedDay) * requestedDay.wday).to_f
    end

    def getDateBudgetForDate(requestedDay)
      (getTotalMonthBudgetForDate(requestedDay) / requestedDay.end_of_month.day).to_f
    end


    private
    def budget_params
      params.permit(:value)
    end
  end
end
