# frozen_string_literal: true

module CarsManager
  class Searcher
    def initialize(cars:, params: {})
      @cars = cars
      @params = params
    end

    def call
      return @cars if @params.empty?

      @cars = @cars.where(make: @params[:make]) if @params[:make]
      @cars = @cars.where(model: @params[:model]) if @params[:model]
      @cars = @cars.where('year >= ?', @params[:year_from].to_i) if @params[:year_from]
      @cars = @cars.where('year <= ?', @params[:year_to].to_i) if @params[:year_to]
      @cars = @cars.where('price >= ?', @params[:price_from].to_i) if @params[:price_from]
      @cars = @cars.where('price <= ?', @params[:price_to].to_i) if @params[:price_to]

      @cars
    end
  end
end
