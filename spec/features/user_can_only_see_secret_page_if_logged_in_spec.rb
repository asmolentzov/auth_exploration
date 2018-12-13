require 'rails_helper'

describe 'As a visitor to the app' do
  it 'cannot visit the secret page if not logged in' do
    visit secret_path
    
    expect(current_path).to eq(login_path)
  end
  it 'can visit the secret page if logged in' do
    user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
    
    visit login_path
    
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
    
    visit secret_path
    
    expect(current_path).to eq(secret_path)
    expect(page).to have_content("SECRETS!")
  end
  
end