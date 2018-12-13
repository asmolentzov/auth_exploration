require 'rails_helper'

describe 'As a logged in visitor to the app' do
  it 'should be able to log out' do
    user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
    
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
    
    expect(current_path).to eq(user_path(user))
    
    click_link "Log Out"
    
    expect(current_path).to eq(login_path)
    expect(session[:current_user_id]).to eq(nil)
    expect(session[:current_password]).to eq(nil)
  end
end