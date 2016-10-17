module Api

  class Report
  attr_accessor :date, :dayState, :weekState, :dayOfWeek,
  :monthState, :dayOfMonth, :dailyBudget, :weeklyBudget,
  :monthlyBudget
  end

  class StateReportsController < Api::BaseController
      def create
       resultReport = Report.new

       requestedDay = Date.parse(params[:date])
       resultReport.date = requestedDay

       resultReport.weekState = getSumOfCostsForWeekTilDate(requestedDay)
       resultReport.monthState = getSumOfCostsForMonthTilDate(requestedDay)
       resultReport.dayState = getSumOfCostsForDay(requestedDay)

       budgetController = BudgetsController.new

       resultReport.monthlyBudget = budgetController.getMonthBudgetForDate(requestedDay)
       resultReport.weeklyBudget  = budgetController.getWeekBudgetForDate(requestedDay)
       resultReport.dailyBudget   = budgetController.getDateBudgetForDate(requestedDay)

       resultReport.dayOfMonth = requestedDay.mday
       resultReport.dayOfWeek = requestedDay.wday

       puts resultReport.inspect


       render json: resultReport, status: :ok

      end

      def getSumOfCostsForDay(requestedDay)
        getAllCostsBetweenDates(requestedDay.beginning_of_day, requestedDay.end_of_day)
      end

      def getSumOfCostsForWeekTilDate(lastDate)
        firstDayInWeek = lastDate.beginning_of_week
        puts firstDayInWeek.inspect
        getAllCostsBetweenDates(firstDayInWeek, lastDate.end_of_day)
      end

      def getSumOfCostsForMonthTilDate(lastDate)
        firstDayInMonth = lastDate.beginning_of_month
        puts firstDayInMonth.inspect
        getAllCostsBetweenDates(firstDayInMonth, lastDate.end_of_day)
      end

      def getAllCostsBetweenDates(firstDate, lasDate)
        Cost.where("created_at >= :start_date AND created_at <= :end_date",
                  {start_date: firstDate, end_date: lasDate}).sum(:price).to_f
      end
  end
end

       #puts params[:year].to_i.inspect
       #puts params[:month].to_i.inspect
       #puts params[:week].to_i.inspect
       #puts params[:day].to_i.inspect
       #today = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
       #resultReport.date = today

       #wkBegin = Date.commercial(params[:year].to_i, params[:week].to_i, 1)
       #wkEnd = Date.commercial(params[:year].to_i, params[:week].to_i, 7)

       #monthBegin = Date.new(params[:year].to_i, params[:month].to_i, 1)
       #monthEnd = Date.new(params[:year].to_i, params[:month].to_i, 1).end_of_month

       #allDayCosts = Array.new
       #allDayCosts = Cost.where("created_at >= :start_date AND created_at <= :end_date",
      #                   {start_date: today.beginning_of_day, end_date: today.end_of_day})


       #allWeekCosts = Array.new
       #allWeekCosts = Cost.where("created_at >= :start_date AND created_at <= :end_date",
      #                   {start_date: wkBegin, end_date: wkEnd})


       #allMonthCosts = Array.new
       #allMonthCosts = Cost.where("created_at >= :start_date AND created_at <= :end_date",
      #                   {start_date: monthBegin, end_date: monthEnd})

       #resultReport.date = today
       #resultReport.dayState = allDayCosts.sum(:price)
       #resultReport.weekState = allWeekCosts.sum(:price)
       #resultReport.monthState = allMonthCosts.sum(:price)

       #currentBudget = Budget.order("created_at").last

       #resultReport.monthlyBudget = currentBudget.value

       #resultReport.dailyBudget = currentBudget.value / 30

       #resultReport.weeklyBudget = resultReport.dailyBudget * 7

       #render json: resultReport, status: :ok
