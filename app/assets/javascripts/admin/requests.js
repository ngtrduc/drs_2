var filter = function(){
  $('#dn-request-filter').click(function(){
    $('.dn-request-filter').toggleClass('dn-none');
  });
};
$(document).ready(filter);
$(document).on('page:load', filter);

var getTimedefault = function(){
  var d = new Date();

  var month = d.getMonth() + 1;
  var day = d.getDate();

  var output = (day<10 ? '0' : '') + day + '/' + (month<10 ? '0' : '') +
    month + '/' + d.getFullYear();

  $('#compensation_time_from').val(output + ' 16:45:00');
  $('#compensation_time_to').val(output + ' 17:45:00');
}
$(document).ready(getTimedefault);
$(document).on('page:load', getTimedefault);

