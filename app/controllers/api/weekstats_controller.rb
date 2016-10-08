module Api

  class SumOfStore
  attr_accessor :store, :sum, :percent
  end

  class WeekstatsController < Api::BaseController
      def create

       wkBegin = Date.commercial(params[:year], params[:week], 1)
       wkEnd = Date.commercial(params[:year], params[:week], 7)

        allWeekStats = Array.new
        stores = Market.categories
        totalSum = 0
        stores.each do |store|
          costsForStore = Array.new
          costsForStore = Cost.where("created_at >= :start_date AND created_at <= :end_date",
                            {start_date: wkBegin, end_date: wkEnd})
          costsForStore = costsForStore.where(store: store)
          sumOfStore = SumOfStore.new
          sumOfStore.store = store
          sumOfStore.sum = costsForStore.sum(:price)
          allWeekStats.push(sumOfStore)
          totalSum += costsForStore.sum(:price)
        end
        allWeekStats.each do |weekStat|
          weekStat.percent = weekStat.sum / totalSum
        end

        render json: allWeekStats

      end

      def show

       wkBegin = Date.commercial(params[:year], params[:week], 1)
       wkEnd = Date.commercial(params[:year], params[:week], 7)

        allWeekStats = Array.new
        stores = Market.categories
        totalSum = 0
        stores.each do |store|
          costsForStore = Array.new
          costsForStore = Cost.where("created_at >= :start_date AND created_at <= :end_date",
                            {start_date: wkBegin, end_date: wkEnd})
          costsForStore = costsForStore.where(store: store)
          sumOfStore = SumOfStore.new
          sumOfStore.store = store
          sumOfStore.sum = costsForStore.sum(:price)
          allWeekStats.push(sumOfStore)
          totalSum += costsForStore.sum(:price)
        end
        allWeekStats.each do |weekStat|
          weekStat.percent = weekStat.sum / totalSum
        end

        render json: allWeekStats
      end
  end
end
