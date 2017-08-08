require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name: 'First User',
      last_name: 'Test',
      email: 'first@example.com',
      password: '123456',
    )

    @category = Category.create! name: 'Apparel'

    10.times do |n|
     @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end
  scenario "Allow user to log in" do
  visit '/'
  
  find_link('Log In').click
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
  click_button 'Log In'
  puts page.html
  expect(page).to have_text @user.first_name
  end
end
