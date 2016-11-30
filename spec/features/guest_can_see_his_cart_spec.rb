require_relative 'feature_helper'

feature 'A visitor is able to select available ingredients and their amount and place an order', %q(
  In order to order some dishes
  As a visitor
  I want to be able to select ingredients
) do

  given(:find_nodes) do
    @forms = page.all('form.new_dish')

    @dish1_plus_links, @dish2_plus_links = @forms[0].all('.plus'), @forms[1].all('.plus')
    @dish1_plus_quantity = @dish1_plus_links.last

    @dish1_minus_links, @dish2_minus_links = @forms[0].all('.minus'), @forms[1].all('.minus')
    @dish1_minus_quantity = @dish1_minus_links.last

    @dish1_multiplier_inputs, @dish2_multiplier_inputs = @forms[0].all('.multiplier input'), @forms[1].all('.multiplier input')
    @dish1_multiplier_quantity_input = @dish1_multiplier_inputs.last
  end

  given!(:core1) { create(:core, name: 'MyCore1') }
  given!(:core2) { create(:core, name: 'MyCore2') }
  given!(:ingredient1) { create(:ingredient, name: 'MyIngredient1') }
  given!(:ingredient2) { create(:ingredient, name: 'MyIngredient2') }
  given!(:ingredient3) { create(:ingredient, name: 'MyIngredient3') }


  scenario 'Visitor goes to index page place an order and sees his cart', js: true do

    visit root_path
    find_nodes

    # playing with first dish
    # ######################

    @dish1_plus_links[0].click
    2.times { @dish1_plus_links[1].click }

    # fill in ingredients for second dish
    # ###################################

    4.times { @dish2_plus_links[1].click }

    # first ingredient for the second dish is empty

    # quantity of three for the first dish
    2.times { @dish1_plus_quantity.click }

    page.all('input[type=submit]')[0].click
    sleep 5
    page.all('input[type=submit]')[1].click

    click_on('My order')

    expect(page).to have_content('MyCore1')
    expect(page).to have_content('MyCore2')

    expect(page).to have_content('MyIngredient1 1')
    expect(page).to have_content('MyIngredient2 2')

    expect(page).to have_content('MyIngredient2 4')

    expect(page).not_to have_content('MyIngredient3')

  end


end

