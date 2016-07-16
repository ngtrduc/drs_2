var add_member = function(){
  $('#add-member').click(function(){
    $('#members').toggleClass('hidden');
    $('#other_members').toggleClass('hidden')
  });
};

$(document).ready(add_member);
$(document).on('page:load', add_member);
