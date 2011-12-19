/*
 * This file handles behaviors for various types of forms
 */

mfp.forms = {

  // corresponds with "new" actions on controllers
  new: {
    
    init: function(){
      // set the autofocus to the "new" field
      $('[autofocus-new]').focus();
      
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
      }).click(function(){
        if( $(this).val() == $(this).data('default') ){
          $(this).val('')
            .removeClass('default-text');
        }
      }).blur(function(){
        if( !$(this).val() ){
          $(this).val($(this).data('default'))
            .addClass('default-text');
        }
      });
      
    },
    
  },
  
  edit: {
    
    init: function(){
      // call new init function since these forms are basically identical
      mfp.forms.new.init.call(mfp.forms.new);

      // set the autofocus to the "edit" field
      $('[autofocus-edit]').focus();
    }
    
  }
  
};