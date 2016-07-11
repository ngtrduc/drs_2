var position_new = function(){
  $('#dn-position-new').click(function(){
  $('.create_position').toggleClass('hidden');
  });
};

$(document).ready(position_new);
$(document).on('page:load', position_new);
