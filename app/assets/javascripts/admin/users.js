var edit_form = function() {
  $('.edit_button').click(function(){
    $('.edit-form').removeClass('hidden');
    $(this).addClass('hidden');
  });
}
$(document).ready(edit_form);
$(document).on('page:load', edit_form);
