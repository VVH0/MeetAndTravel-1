// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require js/bootstrap
//= require js/bootstrap.min
//= require js/contact
//= require js/jquery-3.2.1.min
//= require js/jquery.magnific-popup
//= require js/popper.min
//= require js/script
//= require js/swiper.min
//= require js/validate

setTimeout(fade_out, 5000);

function fade_out() {
  $(".hero-title").fadeOut(300);
};
