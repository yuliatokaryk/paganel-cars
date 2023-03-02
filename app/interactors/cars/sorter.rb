# frozen_string_literal: true

module Cars
  class Sorter
    include Interactor

    def call
      context.cars = context.cars.order("#{context.sort_by} #{context.sort_direction}")
    end
  end
end
