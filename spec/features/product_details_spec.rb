require 'rails_helper'
require 'timeout'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do

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

  scenario "They see the page for the clicked on first product" do
    # ACT
    visit root_path
    ele = page.find('body > main > section > div > article:nth-child(1) > header > a')
    ele.click

    # DEBUG
    sleep(1)
    save_screenshot

    # VERIFY
    expect(page).to have_css 'img.main-img'
    expect(page).to have_css 'body > main > section > header > h1 > a'


  end
end