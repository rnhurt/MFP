/*
 * This file handles behaviors for various types of forms
 */

mfp.forms = {
  
  // corresponds with "new" actions on controllers
  new: {
    
    init: function(){
      
      // text input clear and default
      $('input[type="text"]').each(function(){
        // note to self: this is a disgusting slopjob.  move mfp.forms to function,
        // set methods on prototype to share selector vars and shared methods
        if( !$(this).val() ){
          $(this).val($(this).data('default'))
            .addClass('default-text');
        } else {
          $(this).removeClass('default-text');
        }
      }).focus(function(){
        if( $(this).val().toLowerCase() === $(this).data('default').toLowerCase() ){
          $(this).val('')
            .removeClass('default-text');
        }
      }).blur(function(){
        if( !$(this).val() ){
          $(this).val($(this).data('default'))
            .addClass('default-text');
        }
      });
      
      // Remove the default text when the form is submitted
      $('form').submit(function(){
        $(this).find('.default-text').each(function(){
          if( $(this).val().toLowerCase() === $(this).data('default').toLowerCase() ){
            $(this).val('');
          }
        });
      });
      
    },
    
  },
  
  edit: {
    
    init: function(){
      // call new init function since these forms are basically identical
      mfp.forms.new.init.call(mfp.forms.new);
    }
    
  }
  
};