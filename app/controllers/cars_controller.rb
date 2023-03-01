# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authorize_access, only: %i[edit update destroy]

  def index
    @cars = Car.paginate(page: params[:page])
    if search_params
      @cars = search_cars.cars
      save_history
      add_statistic
    end

    @cars = sort_cars.cars
  end

  def show
    Cars::ViewsCounter.call(car: @car)
  end

  def new
    @car = authorize Car.new
  end

  def edit; end

  def create
    @car = authorize Car.new(car_params)
    @car.views = 0

    if @car.save
      redirect_to cars_path
    else
      render 'new'
    end
  end

  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render 'edit'
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :odometer, :price, :description, :picture)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def authorize_access
    authorize @car
  end

  def search_params
    @search_params ||= params[:search_rules]&.select { |_k, v| v.strip != '' }
  end

  def save_history
    return unless user_signed_in?
    return if current_user.admin?

    SearchHistory::SaveSearch.call(params: search_params, user: current_user.id)
  end

  def add_statistic
    Statistics::UpdateStatistics.call(params: search_params, total_quantity: @cars.count)
  end

  def search_cars
    Cars::Searcher.call(cars: @cars, params: search_params)
  end

  def sort_cars
    Cars::Sorter.call(
      cars: @cars,
      sort_by: params['sort_by'] || 'created_at',
      sort_direction: params['sort_direction'] || 'desc'
    )
  end

  helper_method :search_params
end
