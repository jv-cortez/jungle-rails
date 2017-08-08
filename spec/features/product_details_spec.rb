require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do

  before :each do
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

  scenario " User can click the product details" do
    #ACT 
    visit root_path
    

    #VERIFY
    # first('article.product').click
    sleep(3)
      first('footer.actions').find_link('Details').click
      sleep(3)
      
    #DEBUG 
    save_screenshot 'products_page.png'
    expect(page).to have_css 'section.products-show'
  end

end
