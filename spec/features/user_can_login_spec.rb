require 'rails_helper' 

describe 'As an existing user to our site' do
  it 'should be able to log in' do
    user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
    
    visit login_path
    
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{User.last.name}!")
  end
  it 'should get an error message if login does not work' do
    visit login_path
    
    click_button "Log In"
    expect(page).to have_content("ACCESS DENIED Try again I guess")
  end
  it 'should remember user if existing user' do
    user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
    
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
    
    expect(current_path).to eq(user_path(user))
    
    visit login_path
    
    expect(current_path).to eq(user_path(user))
  end
end