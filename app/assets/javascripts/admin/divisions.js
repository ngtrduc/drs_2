var division_new = function(){
  $('#dn-division-new').click(function(){
    $('.create_division').toggleClass('dn-none');
  });
};

$(document).ready(division_new);
$(document).on('page:load', division_new);
