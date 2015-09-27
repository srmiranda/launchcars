class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "New car added"
      redirect_to cars_path
    else
      flash[:error] = @car.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end
end
