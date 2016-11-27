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

  given!(:core1) { create(:core) }
  given!(:core2) { create(:core) }
  given!(:ingredient1) { create(:ingredient) }
  given!(:ingredient2) { create(:ingredient) }


  scenario 'Visitor goes to index page and sets valid options and place order', js: true do

    visit root_path
    find_nodes

    # playing with first dish
    # ######################
    

    # summing up pluses and minuses
    2.times { @dish1_plus_links[0].click }
    expect(@dish1_multiplier_inputs[0].value).to eq '2'
    1.times { @dish1_minus_links[0].click }
    expect(@dish1_multiplier_inputs[0].value).to eq '1'

    # second ingredient
    2.times { @dish1_plus_links[1].click }
    expect(@dish1_multiplier_inputs[1].value).to eq '2'


    # fill in ingredients for second dish
    # ###################################

    3.times { @dish2_plus_links[0].click }
    expect(@dish2_multiplier_inputs[0].value).to eq '3'

    4.times { @dish2_plus_links[1].click }
    expect(@dish2_multiplier_inputs[1].value).to eq '4'
    # quantity of the first dish
    # it start with 1 as default value
    5.times { @dish1_plus_quantity.click }
    2.times { @dish1_minus_quantity.click }
    expect(@dish1_multiplier_quantity_input.value).to eq '4'
    

    page.all('input[type=submit]')[0].click
    expect(page).to have_content("Dish was successfully created")

    expect(current_path).to eq root_path
  end

  scenario 'Visitor tries to submit invalid data', js: true do
    visit root_path
    find_nodes

    # minimal value for ingredient is zero
    10.times { @dish1_minus_links[0].click }
    expect(@dish1_multiplier_inputs[0].value).to eq '0'
    
    # minimal value for dish quantity is one
    10.times { @dish1_minus_quantity.click }
    expect(@dish1_multiplier_quantity_input.value).to eq '1'

    within @forms[0] do
      fill_in 'dish_multiplier', with: '0'
    end
    page.all('input[type=submit]')[0].click
    expect(page).to have_content("Multiplier must be greater than or equal to 1")

    within @forms[0] do
      fill_in 'dish_multiplier', with: '6.4'
    end
    page.all('input[type=submit]')[0].click
    expect(page).to have_content("Multiplier must be an integer")

  end

end

