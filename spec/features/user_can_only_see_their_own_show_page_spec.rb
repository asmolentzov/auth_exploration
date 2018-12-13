require 'rails_helper'

describe 'As a logged in user to the app' do
  it 'should be able to see its show page but not another users' do
    user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
    user_2 = User.create(name: "John Doe", email: "johndoe@gmail.com", password: "password123")
    
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.name}!")
    
    visit user_path(user_2)
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.name}!")
    
  end
end