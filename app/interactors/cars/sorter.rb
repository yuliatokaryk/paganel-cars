# frozen_string_literal: true

module Cars
  class Sorter
    include Interactor

    def call
      @cars = context.cars
      @sort_by = context.sort_by
      @sort_direction = context.sort_direction

      sort_cars
    end

    private

    def sort_cars
      context.cars = @cars.order("#{@sort_by} #{@sort_direction}")
    end
  end
end
