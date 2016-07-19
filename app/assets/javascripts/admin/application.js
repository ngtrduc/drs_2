// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require i18n/translations
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require adminlte
//= require datepicker
//= require_tree .

$(document).on('ready', function() {
  set_timetout();
  datepick();
});

$(document).on('page:load', function(){
  datepick();
});

function set_timetout() {
  $('.alert').delay(3000).slideUp();
}

function datepick(){
  $('.input-daterange').datepicker({
    format: I18n.t("request.time_type_3")
  });
};
