module Api

  class SumOfStore
  attr_accessor :store, :sum, :percent
  end

  class MonthstatsController < Api::BaseController
      def create

       monthBegin = Date.new(params[:year], params[:month], 1)
       monthEnd = Date.new(params[:year], params[:month], 1).end_of_month

       puts monthBegin.inspect
       puts monthEnd.inspect

        allMonthStats = Array.new
        stores = Market.categories
        totalSum = 0
        stores.each do |store|
          costsForStore = Array.new
          costsForStore = Cost.where("created_at >= :start_date AND created_at <= :end_date",
                            {start_date: monthBegin, end_date: monthEnd})
          costsForStore = costsForStore.where(store: store)
          sumOfStore = SumOfStore.new
          sumOfStore.store = store
          sumOfStore.sum = costsForStore.sum(:price)
          allMonthStats.push(sumOfStore)
          totalSum += costsForStore.sum(:price)
        end
        allMonthStats.each do |monthStat|
          if totalSum == 0 then
            monthStat.percent = totalSum
          else
            monthStat.percent = monthStat.sum / totalSum
          end
        end

        render json: allMonthStats, status: ok

      end

  end
end
