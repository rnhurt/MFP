// on document.ready...
$(function(){
  mfp.init();
});

// main namespace for mfp app
mfp = window.mfp || {};

// initialization...
// anything that needs to run globally on page load should go inside this function
mfp.init = function(){
  var flash = $('#flash');
  if( flash.html().match(/\w/) ){
    flash.slideDown();
  }
};