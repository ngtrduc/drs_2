var edit_form = function() {
  $('.edit_button').click(function(){
    $('.edit-form').removeClass('hidden');
    $(this).addClass('hidden');
    $('.dn-user-delete').addClass('hidden');
  });
};

var save_change = function(){
  $('.dn-btn-save').click(function(){
    $('.dn-user-delete').removeClass('hidden')
  });
};

var cancel_change = function(){
  $('#cancel-btn').click(function(){
    $('.edit-form').addClass('hidden');
    $(this).removeClass('hidden');
    $('.dn-user-delete').removeClass('hidden');
  })
}

$(document).ready(edit_form);
$(document).on('page:load', edit_form);

$(document).ready(save_change);
$(document).on('page:load', save_change);

$(document).ready(cancel_change);
$(document).on('page:load', cancel_change);
