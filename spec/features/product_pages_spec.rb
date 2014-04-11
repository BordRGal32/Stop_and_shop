require 'spec_helper'

feature 'Creating a new product' do
  scenario 'from the main page' do
    visit root_path
    click_on "New Product"
    page.should have_content "Add a New Product"
  end

  scenario 'successfully creates a product' do
    visit new_product_path
    product = FactoryGirl.create(:product)
    fill_in "Name", :with => product.name
    fill_in "Description", :with => product.description
    fill_in "Price", :with => product.price
    click_on "Create Product"
    page.should have_content product.name
  end
  scenario 'successfully updates a product' do
    product = FactoryGirl.create(:product)
    visit edit_product_path(product)
    fill_in 'Name', :with => "Fantastic Widgets"
    click_on "Update Product"
    page.should have_content "Fantastic"
  end
  scenario 'succesfully deletes a product' do
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_on "Delete Product"
    page.should have_content "Welcome"
  end

end
