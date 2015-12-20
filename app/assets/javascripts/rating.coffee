$ ->
  $('body').on 'change', 'input.story-rating', ->
    $('form#new_rating').submit()
