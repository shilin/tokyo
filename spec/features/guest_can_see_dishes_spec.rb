require_relative 'feature_helper'

feature 'A visitor is able to see list of dishes with available ingredients', %q(
  In order to order some dishes
  As a visitor
  I want to be able to see available dishes to build
) do

  given!(:core1) { create(:core, name: 'MyCore1') }
  given!(:core2) { create(:core, name: 'MyCore2') }
  given!(:ingredient1) { create(:ingredient, name: 'MyIngredient1') }
  given!(:ingredient2) { create(:ingredient, name: 'MyIngredient2') }

  scenario 'Visitor goes to index page' do


    visit root_path

    %w(MyCore1 MyCore2 MyIngredient1 MyIngredient2).each do |name|
      expect(page).to have_content name
    end

    expect(current_path).to eq root_path
  end

end

