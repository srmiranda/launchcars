require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }

  it { should have_valid(:password).when("funnypassword") }
  it { should_not have_valid(:password).when(nil, "") }

  it { should have_valid(:email).when("srmiranda1@gmail.com") }
  it { should_not have_valid(:email).when(nil, "") }
end
