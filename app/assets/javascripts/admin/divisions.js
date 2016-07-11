var division_new = function(){
  $('#dn-division-new').click(function(){
    $('.create_division').toggleClass('dn-none');
  });
};

$(document).ready(division_new);
$(document).on('page:load', division_new);

var division_edit = function(){
  $('#dn-show-division-edit').click(function(){
    $('.dn-show-division-h1').addClass('dn-none');
    $('.dn-show-division-name').removeClass('dn-none');
    $('.dn-show-divionsion-save').removeClass('dn-none');
    $(this).addClass('dn-none');
  });
};

$(document).ready(division_edit);
$(document).on('page:load', division_edit);
