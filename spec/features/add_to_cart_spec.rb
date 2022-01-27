require 'rails_helper'

RSpec.feature "Visitor navigates to home page and clicks add on product", type: :feature, js: true do

  # SETUP
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

  scenario "They see their item added to cart" do
    # ACT
    visit root_path
    ele = page.click_on('Add', match: :first)
    # DEBUG
    sleep(1)
    save_screenshot
    nav = find('.navbar')
    # VERIFY
    expect(nav.has_content?('My Cart (1)')).to eq(true) 
  end
end