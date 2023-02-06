class Car < ApplicationRecord
  has_one_attached :picture

  validates :make, presence: true, length: { maximum: 50 }
  validates :model, presence: true, length: { maximum: 50 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1990, less_than_or_equal_to: 2023 }
  validates :odometer, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def name
    "#{make} #{model}"
  end
end
