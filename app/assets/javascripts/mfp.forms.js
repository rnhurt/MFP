/*
 * This file handles behaviors for various types of forms
 */

mfp.forms = {
  
  // corresponds with "new" actions on controllers
  new: {
    
    init: function(){
      
      // text input clear and default
      $('input[type="text"]').each(function(){
        $(this).data('default', $(this).val())
          .addClass('default-text');
      }).click(function(){
        if( $(this).val() == $(this).data('default') ){
          $(this).val('')
            .removeClass('default-text');
        }
      }).blur(function(){
        if( $(this).val() == '' ){
          $(this).val($(this).data('default'))
            .addClass('default-text');
        }
      });
      
    }
  }
  
};