var skill_new = function(){
  $('#dn-skill-new').click(function(){
    $('.create_skill').toggleClass('hidden');
  });
};

$(document).ready(skill_new);
$(document).on('page:load', skill_new);
