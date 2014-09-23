# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

HomePage =
  initialize: ->
    hasScrolled = ->
      st = $(this).scrollTop()
      didScroll = undefined
      lastScrollTop = 0
      delta = 5
      navbarHeight = $("header").outerHeight()
      # Make sure they scroll more than delta
      return  if Math.abs(lastScrollTop - st) <= delta

      # If they scrolled down and are past the navbar, add class .nav-up.
      # This is necessary so you never see what is "behind" the navbar.
      if st > lastScrollTop and st > navbarHeight

        # Scroll Down
        $("header").removeClass("nav-down").addClass "nav-up"
      else

        # Scroll Up
        $("header").removeClass("nav-up").addClass "nav-down"  if st + $(window).height() < $(document).height()
      lastScrollTop = st
      return

    $(window).scroll (event) ->
      didScroll = true
      return

    setInterval (->
      if didScroll
        hasScrolled()
        didScroll = false
      return
    ), 250

HomePage.initialize()
