// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require best_in_place
//= require jquery.purr
//= require best_in_place.purr
//= require turbolinks
//= require foundation
//= require recurring_select
//= require foundation-datepicker
//= require highcharts/highcharts
//= require cocoon
//= require_tree .


function ready() {
    $(document).foundation();
    $('.fdatepicker').fdatepicker({format: 'yyyy-mm-dd'});
    $(document).ajaxError(function (e, xhr, settings) {
        if (xhr.status == 401) {
            location.reload();
        }
    });
}
$(function() {

    $(document).ready(ready);
    $(document).on('page:load', ready);
    jQuery(".best_in_place").best_in_place();

});