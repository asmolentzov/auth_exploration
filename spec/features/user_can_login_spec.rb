require 'rails_helper' 

describe 'As an existing user to our site' do
  it 'should be able to log in' do
    user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
    
    visit '/login'
    
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button "Log In"
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{User.last.name}!")
  end
end