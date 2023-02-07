# frozen_string_literal: true

module CarsManager
  # Service to add car views
  class ViewsCounter
    def initialize(car)
      @car = car
    end

    def call
      @car.views += 1
      @car.save!
    end
  end
end
