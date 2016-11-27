require_relative 'feature_helper'

feature 'A visitor is able to select available ingredients and their amount', %q(
  In order to order some dishes
  As a visitor
  I want to be able to select ingredients
) do

  given!(:core1) { create(:core) }
  given!(:core2) { create(:core) }
  given!(:ingredient1) { create(:ingredient) }
  given!(:ingredient2) { create(:ingredient) }

  scenario 'Visitor goes to index page', js: true do

    visit root_path

    forms = page.all('form.new_dish')

    dish1_plus_links, dish2_plus_links = forms[0].all('.plus'), forms[1].all('.plus')
    dish1_minus_links, dish2_minus_links = forms[0].all('.minus'), forms[1].all('.minus')
    dish1_multiplier_inputs, dish2_multiplier_inputs = forms[0].all('.multiplier input'), forms[1].all('.multiplier input')

    # playing with first dish
    # ######################
    
    # not less then zero any time
    10.times { dish1_minus_links[0].click }
    expect(dish1_multiplier_inputs[0].value).to eq '0'

    # summing up pluses and minuses
    2.times { dish1_plus_links[0].click }
    expect(dish1_multiplier_inputs[0].value).to eq '2'
    1.times { dish1_minus_links[0].click }
    expect(dish1_multiplier_inputs[0].value).to eq '1'

    # second ingredient
    2.times { dish1_plus_links[1].click }
    expect(dish1_multiplier_inputs[1].value).to eq '2'

    # fill in ingredients for second dish
    # ###################################

    3.times { dish2_plus_links[0].click }
    expect(dish2_multiplier_inputs[0].value).to eq '3'

    4.times { dish2_plus_links[1].click }
    expect(dish2_multiplier_inputs[1].value).to eq '4'

    expect(current_path).to eq root_path
  end

end

