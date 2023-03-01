# frozen_string_literal: true

module Cars
  class Searcher
    include Interactor

    def call
      search_by_make
      search_by_model
      search_by_year_from
      search_by_year_to
      search_by_price_from
      search_by_price_to

      context.cars
    end

    private

    def search_by_make
      context.cars = context.cars.where(make: context.params[:make]) if context.params[:make]
    end

    def search_by_model
      context.cars = context.cars.where(model: context.params[:model]) if context.params[:model]
    end

    def search_by_year_from
      context.cars = context.cars.where('year >= ?', context.params[:year_from].to_i) if context.params[:year_from]
    end

    def search_by_year_to
      context.cars = context.cars.where('year <= ?', context.params[:year_to].to_i) if context.params[:year_to]
    end

    def search_by_price_from
      context.cars = context.cars.where('price >= ?', context.params[:price_from].to_i) if context.params[:price_from]
    end

    def search_by_price_to
      context.cars = context.cars.where('price <= ?', context.params[:price_to].to_i) if context.params[:price_to]
    end
  end
end
