$(function() {
  // Make the tables a bit prettier
  // $('.tablesorter').tablesorter({widgets: ['zebra']});

  // Make the flash notices a bit prettier
  $('#flash .close').click(function() {
    $(this).animate({height: 'hide'}, 'fast');
  });

  // remote links handler
  $('tr[url]').live('click', function() {
    $(window.location).attr('href', $(this).attr('url'));
  });

  // setup ul.tabs to work as tabs for each div directly under div.panes
  $("ul.tabs").tabs("div.panes > div");
}); 
