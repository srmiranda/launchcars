class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :mileage, presence: true
  validates :mileage, numericality: { only_integer: true }
  validates :year, presence: true
  validates :year, numericality: { only_integer: true }
  validates :year, numericality: { greater_than_or_equal_to: 1920 }

  def car_rating
    condition = ""
    if (mileage >= 500000 && year <= 2000)
      condition = "Poor"
    elsif (mileage < 500000 && mileage >= 200000) && (year > 2000 && year <= 2005)
      condition = "Fair"
    elsif (mileage < 200000 && mileage >= 30000) && (year > 2005 && year <= 2010)
      condition = "Good"
    elsif mileage >= 500000
      condition = "Poor"
    elsif mileage < 500000 && mileage >= 200000
      condition = "Fair"
    elsif mileage < 200000 && mileage >= 30000
      condition = "Good"
    else
      condition = "Excellent"
    end
    condition
  end
end
