$(function() {
  // Make the tables a bit prettier
  $('.tablesorter').tablesorter({widgets: ['zebra']});

  // Make the flash notices a bit prettier
  $('#flash .close').click(function() {
    $(this).animate({height: 'hide'}, 'fast');
  });

}); 
