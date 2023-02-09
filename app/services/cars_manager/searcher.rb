# frozen_string_literal: true

module CarsManager
  class Searcher
    def initialize(cars:, params: {})
      @cars = cars
      @params = params
    end

    def call
      return @cars if @params.empty?

      search_cars_by_make
      search_cars_by_model
      search_cars_by_year_from
      search_cars_by_year_to
      search_cars_by_price_from
      search_cars_by_price_to
      @cars
    end

    private

    def search_cars_by_make
      @cars = @cars.where(make: @params[:make]) if @params[:make]
    end

    def search_cars_by_model
      @cars = @cars.where(model: @params[:model]) if @params[:model]
    end

    def search_cars_by_year_from
      @cars = @cars.where('year >= ?', @params[:year_from].to_i) if @params[:year_from]
    end

    def search_cars_by_year_to
      @cars = @cars.where('year <= ?', @params[:year_to].to_i) if @params[:year_to]
    end

    def search_cars_by_price_from
      @cars = @cars.where('price >= ?', @params[:price_from].to_i) if @params[:price_from]
    end

    def search_cars_by_price_to
      @cars = @cars.where('price <= ?', @params[:price_to].to_i) if @params[:price_to]
    end
  end
end
