require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "They see the cart" do
    # ACT
    visit root_path

    first("article.product").find_button('Add').click
    
    expect(page).to have_text ' My Cart (1) '

    find_link(href: '/cart').click
    page.find('.cart-show')

    save_screenshot

    expect(page).to have_text 'TOTAL:'
    # DEBUG / VERIFY
   
    
  end
  
end
