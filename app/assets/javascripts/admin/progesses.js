var progess_new = function(){
  $('#dn-progess-new').click(function(){
  $('.create_progess').toggleClass('hidden');
  });
};

$(document).ready(progess_new);
$(document).on('page:load', progess_new);
