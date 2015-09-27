require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'cars' do
    let!(:car) do
      FactoryGirl.create(:car)
    end

    it { should have_valid(:color).when("red") }
    it { should_not have_valid(:color).when(nil) }

    it { should have_valid(:year).when(2008) }
    it { should_not have_valid(:year).when(1918, '', nil) }

    it { should have_valid(:mileage).when(75000) }
    it { should_not have_valid(:mileage).when('', nil) }

    it { should have_valid(:description).when('Great') }

    it { should belong_to(:manufacturer) }

    it "returns the correct condition for the mileage" do
      car.car_rating.should == "Good"
      car.car_rating.should_not == "Poor"
      car.car_rating.should_not == "Fair"
      car.car_rating.should_not == "Excellent"
    end

    it "still returns an excellent condition for a classic car with low miles" do
      car.mileage = 10000
      car.year = 1955
      car.car_rating.should == "Excellent"
    end

    it "still returns a poor rating for a new car with lots of miles" do
      car.mileage = 600000
      car.year = 2016
      car.car_rating.should == "Poor"
    end
  end
end
