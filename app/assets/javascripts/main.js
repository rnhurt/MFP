/*
 * This file sets up the main namespace object, and does initialization for global behaviors.
 */

// on document.ready...
$(function(){
  mfp.init();
});

// main namespace for mfp app
mfp = window.mfp || {};

// initialization...
// anything that needs to run globally on page load should go inside this function
mfp.init = function(){
  
  // handle flash notices
  var flash = $('#flash');
  if( flash.html().match(/\w/) ){
    flash.slideDown();
  }
  
  // header collapse on load
  mfp.header.init();
  
};

// header collapse and expand behaviors
mfp.header = {
  init: function(){
    $('#header_mini').live('mouseenter', function(){
      $(this).slideUp('fast', function(){
        mfp.header.expand();
      });
    });
    $('#header').live('mouseleave', function(e){
      e.stopPropagation();
      mfp.header.collapse();
    });
  },
  
  collapse: function(){
    $('#header').slideUp('fast', function(){
      $('#header_mini').slideDown('fast');
    });
  },
  
  expand: function(){
    $('#header').slideDown('fast');
  }
};