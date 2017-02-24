$(document).on "turbolinks:load", ->
  $('.dish-teaser').click (e) ->
    $(this).hide()
    $(this).siblings('.dish-detail').show()
