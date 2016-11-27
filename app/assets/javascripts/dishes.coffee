# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('.minus').click (e) ->
    e.preventDefault()

    node = findMultiplierNode(this)
    subtractOne(node)

  $('.plus').click (e) ->
    e.preventDefault()

    node = findMultiplierNode(this)
    addOne(node)

# $(document).ready(binding) # "вешаем" функцию binding на событие document.ready

findMultiplierNode = (currentNode) -> 
  $(currentNode).closest('.multipliable-item').find('.multiplier input')

subtractOne = (node) ->
  old_value = +node.val()
  minimal_value = if node.closest('.multipliable-item.dish-quantity')
      1
    else
      0

  node.val(old_value - 1) if old_value > minimal_value
 # node.val(old_value - 1) unless old_value == 0
  

addOne = (node) ->
  old_value = +node.val()
  node.val(old_value + 1)

$(document).ready(ready) # "вешаем" функцию ready на событие document.ready


# $(document).on('page:load', binding)  # "вешаем" функцию ready на событие page:load
# $(document).on('page:update', binding) # "вешаем" функцию ready на событие page:update
# $(document).on('page:load', ready)  # "вешаем" функцию ready на событие page:load
# $(document).on('page:update', ready) # "вешаем" функцию ready на событие page:update
#
