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
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require materialize-sprockets
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery-ui
//= require moment
//=require underscore
//=require clndr-rails
//= require bootstrap-datetimepicker
//= require react
//= require react_ujs
//= require components
//= require_tree .


$(".navbar-right a").on("click", function(){
   $(".navbar").find(".active").removeClass("active");
   $(this).parent().addClass("active");
});

$('.workout-form').html("<%= j (render 'form') %>");
$('.workout-form').slideDown(350);
