# frozen_string_literal: true

module Cars
  class ViewsCounter
    include Interactor

    def call
      context.car.views += 1
      context.car.save!
    end
  end
end
