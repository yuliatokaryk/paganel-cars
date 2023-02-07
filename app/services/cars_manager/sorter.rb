# frozen_string_literal: true

module CarsManager
  # Service to sort cars list
  class Sorter
    def initialize(cars, sort_option, sort_direction)
      @cars = cars
      @sort_option = sort_option
      @sort_direction = sort_direction
    end

    def call
      @cars.order("#{@sort_option} #{@sort_direction}")
    end
  end
end
