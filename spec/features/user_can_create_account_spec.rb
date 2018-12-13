require 'rails_helper'

describe 'As a new visitor to our app' do
  it 'should be able to create an account' do
    visit root_path
    
    # expect(current_path).to eq(new_user_path)
    
    name = "Jane Doe"
    email = "jane.doe@gmail.com"
    password = "password123"
    
    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_button "Create User"
    
    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{User.last.name}!")
  end
end