ready = ->
  $('.minus').click (e) ->
    e.preventDefault()

    node = findMultiplierNode(this)
    subtractOne(node)

  $('.plus').click (e) ->
    e.preventDefault()

    node = findMultiplierNode(this)
    addOne(node)

findMultiplierNode = (currentNode) -> 
  $(currentNode).closest('.multipliable-item').find('.multiplier input')

subtractOne = (node) ->
  old_value = +node.val()
  minimal_value = if node.parents('.multipliable-item.dish-quantity').length then 1 else 0

  node.val(old_value - 1) if old_value > minimal_value

addOne = (node) ->
  old_value = +node.val()
  node.val(old_value + 1)

$(document).ready(ready) # "вешаем" функцию ready на событие document.ready
