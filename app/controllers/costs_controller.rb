class CostsController < ApplicationController
  before_filter :authorize

  def index
    @costs = Cost.all
  end

  def show
    @cost = Cost.find(params[:id])
  end

  def new
    @cost = Cost.new
  end

  def edit
    @cost = Cost.find(params[:id])
  end

  def create
    @cost = Cost.new(cost_params)
    @cost.user_id = session[:user_id]
    if @cost.save
      redirect_to @cost
    else
      render 'new'
    end
  end

  def update
    @cost = Cost.find(params[:id])

    if @cost.update(cost_params)
      redirect_to @cost
    else
      render 'edit'
    end
  end

  def destroy
    @cost = Cost.find(params[:id])
    @cost.destroy

    redirect_to costs_path
  end

  private
  def cost_params
    params.require(:cost).permit(:price, :store, :comment)
  end
end
