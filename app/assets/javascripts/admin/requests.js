var filter = function(){
  $('#dn-request-filter').click(function(){
    $('.dn-request-filter').toggleClass('dn-none');
  });
};

$(document).ready(filter);
$(document).on('page:load', filter);
