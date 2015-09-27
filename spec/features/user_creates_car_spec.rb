require 'rails_helper'

feature 'user adds a car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  context 'add a new car' do
    scenario 'entry is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      select('Dodge', :from => 'car[manufacturer_id]')

      fill_in 'car[color]', with: "red"
      fill_in 'car[year]', with: 2012
      fill_in 'car[mileage]', with: 75000
      click_button 'Submit'

      expect(page).to have_content('New car added')
      expect(page).to have_content('Dodge')
      expect(page).to have_content(2012)
      expect(page).to have_content(75000)
      expect(page).to have_content("red")
      expect(page).to have_content("Good")

      expect(cars_path(@car)).to eq(current_path)
    end

    scenario 'entry is invalid' do
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      click_button 'Submit'

      expect(page).to have_content("Color can't be blank")
      expect(page).to have_content("Year can't be blank")
      expect(page).to have_content("Mileage can't be blank")
      expect(page).to_not have_content('Dodge')

      expect(cars_path).to eq(current_path)
    end

    scenario 'optionally specify description' do
      manufacturer = FactoryGirl.create(:manufacturer)
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      select('Dodge', :from => 'car[manufacturer_id]')
      fill_in 'car[color]', with: "red"
      fill_in 'car[year]', with: 2012
      fill_in 'car[mileage]', with: 75000
      fill_in 'car[description]', with: 'Great'

      click_button 'Submit'

      expect(page).to have_content('New car added')
      expect(page).to have_content('Dodge')
      expect(page).to have_content(2012)
      expect(page).to have_content(75000)
      expect(page).to have_content("red")

      expect(cars_path(@car)).to eq(current_path)
    end
  end
end
