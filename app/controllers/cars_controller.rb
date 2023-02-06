class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
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

  def filter_params
    params[:filter]&.select { |k, v| v.strip != '' }
  end
end
