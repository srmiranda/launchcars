require 'rails_helper'

feature 'user adds a car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  And see a proper condition for its mileage
} do

  context 'add a new car to see its condition' do
    scenario 'condition is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      select('Dodge', :from => 'car[manufacturer_id]')

      fill_in 'car[color]', with: "red"
      fill_in 'car[year]', with: 2012
      fill_in 'car[mileage]', with: 100
      click_button 'Submit'

      expect(page).to have_content("Excellent")
      expect(page).to_not have_content('Good')
      expect(page).to_not have_content('Fair')
      expect(page).to_not have_content('Poor')

      expect(cars_path(@car)).to eq(current_path)
    end

    scenario 'condition is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      select('Dodge', :from => 'car[manufacturer_id]')

      fill_in 'car[color]', with: "red"
      fill_in 'car[year]', with: 2012
      fill_in 'car[mileage]', with: 30000
      click_button 'Submit'

      expect(page).to have_content("Good")
      expect(page).to_not have_content('Excellent')
      expect(page).to_not have_content('Fair')
      expect(page).to_not have_content('Poor')

      expect(cars_path(@car)).to eq(current_path)
    end

    scenario 'condition is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      select('Dodge', :from => 'car[manufacturer_id]')

      fill_in 'car[color]', with: "red"
      fill_in 'car[year]', with: 2012
      fill_in 'car[mileage]', with: 200000
      click_button 'Submit'

      expect(page).to have_content("Fair")
      expect(page).to_not have_content('Good')
      expect(page).to_not have_content('Excellent')
      expect(page).to_not have_content('Poor')

      expect(cars_path(@car)).to eq(current_path)
    end

    scenario 'condition is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)
      user = FactoryGirl.create(:user)
      login(user)

      visit new_car_path

      select('Dodge', :from => 'car[manufacturer_id]')

      fill_in 'car[color]', with: "red"
      fill_in 'car[year]', with: 2012
      fill_in 'car[mileage]', with: 500000
      click_button 'Submit'

      expect(page).to have_content("Poor")
      expect(page).to_not have_content('Good')
      expect(page).to_not have_content('Fair')
      expect(page).to_not have_content('Excellent')

      expect(cars_path(@car)).to eq(current_path)
    end
  end
end
