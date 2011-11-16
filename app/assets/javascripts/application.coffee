#= require_tree .

#
# This file sets up the main namespace object, and does initialization for global behaviors.
#

# on document.ready...
$ ->
  mfp.init()

# main namespace for mfp app
window.mfp = window.mfp ? {}

# initialization...
# anything that needs to run globally on page load should go inside this function
mfp.init = ->
  
  # handle flash notices
  flash = $('#flash')
  if flash.html().match(/\w/)
    flash.slideDown()
  
  # header collapse on load
  mfp.header.init()
  

# header collapse and expand behaviors
mfp.header =
  init: ->
    $('#header_mini').live('mouseenter',
      -> $(this).slideUp('fast',
        -> mfp.header.expand()
      )
    )

    $('#header').live('mouseleave',
      (e) ->
        e.stopPropagation()
        mfp.header.collapse()
    )

  collapse: ->
    $('#header').slideUp('fast',
      -> $('#header_mini').slideDown('fast')
    )

  expand: ->
    $('#header').slideDown('fast')
    

# Form behaviors
mfp.forms =

  # corresponds with "new" actions on controllers
  new:
    
    init: ->
      # text input clear and default
      $('input[type="text"]').each(
        -> $(this).data('default', $(this).val())
          .addClass('default-text')
      ).click(
        -> if $(this).val() == $(this).data('default')
          $(this).val('')
            .removeClass('default-text')
      ).blur(
        -> if $(this).val() == ''
          $(this).val($(this).data('default'))
            .addClass('default-text')
      )
      
      # date/time picker
      $('input[name*="timestamp"]').AnyTime_picker({format:'%Y-%m-%d %H:%i'})
