require 'rails_helper'

feature 'user creates a car manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do
  scenario 'enter a manufacturer' do
    user = FactoryGirl.create(:user)
    login(user)

    visit new_manufacturer_path

    fill_in 'Name', with: 'Dodge'
    fill_in 'Country', with: 'USA'
    click_button 'Submit'
    expect(page).to have_content('Dodge')
    expect(page).to have_content('USA')
  end

  scenario 'submit a blank form' do
    user = FactoryGirl.create(:user)
    login(user)

    visit new_manufacturer_path

    click_button 'Submit'
    expect(page).to have_content("Name can't be blank, Country can't be blank Enter a Manufacturer Name Country")
  end

  scenario 'submit a form with a blank name' do
    user = FactoryGirl.create(:user)
    login(user)

    visit new_manufacturer_path

    fill_in 'Country', with: 'USA'
    click_button 'Submit'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'submit a form with a blank name' do
    user = FactoryGirl.create(:user)
    login(user)

    visit new_manufacturer_path

    fill_in 'Name', with: 'Dodge'
    click_button 'Submit'
    expect(page).to have_content("Country can't be blank")
  end
end
