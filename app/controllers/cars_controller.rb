# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authorize_access, only: %i[edit update destroy]

  def index
    @cars = Car.paginate(page: params[:page])
    if search_params
      @cars = CarsManager::Searcher.new(cars: @cars, params: search_params).call
      save_history
      add_statistic
    end

    @cars = CarsManager::Sorter.new(@cars, params['sort_by'] || 'created_at', params['sort_direction'] || 'desc').call
  end

  def show
    CarsManager::ViewsCounter.new(@car).call
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

    SearchHistory::Manager.new(params: search_params || {}, user: current_user[:id]).call
  end

  def add_statistic
    Statistics::Manager.new(total_quantity: @cars.count, params: search_params).call
  end

  helper_method :search_params
end
