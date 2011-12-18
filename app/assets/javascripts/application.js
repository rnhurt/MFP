// Begin processing jQuery commands after the page loads
$(function() {
  simpleFill();     // Fill in any default values in forms
  header();

  $("input.focus:last").focus();  // Set the focus on the last input tag with a class of "focus"
})

function header(){
  $('#header_mini').live('mouseenter', function(){
    $(this).slideUp('fast', function(){
      $('#header').slideDown('fast')
    });
  });

  $('#header').live('mouseleave', function(e){
    e.stopPropagation();
    $('#header').slideUp('fast', function(){
      $('#header_mini').slideDown('fast')
    });
  });
}

function simpleFill() {
  // Add the default text when the field is blank
  $(".defaultText").focus(function(srcc) {
    if ($(this).val() == $(this)[0].title || $(this).val() == "") {
      $(this).removeClass("defaultTextActive");
      $(this).val("");
    }
  });

  // Remove the default text when the user enters the field
  $(".defaultText").blur(function() {
    if ($(this).val() == "") {
      $(this).addClass("defaultTextActive");
      $(this).val($(this)[0].title);
    }
  });

  // Remove the default text when the form is submitted
  $("form").submit(function() {
    $(this).find(".defaultText").each(function() {
      if($(this).val() == $(this)[0].title) {
        $(this).val("");
      }
    });
  });

  $(".defaultText").blur();
}
