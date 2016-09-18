// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.guillotine
//= require_tree .




// TODO: POSSIBLE SOLUTION: CHANGE TO ANON FUNCTION
// $(document).ready(function(){
$(document).ready(function($){
	var guillotine_width = parseInt($(".photo-container").data("guillotine-width"));
	var guillotine_height = parseInt($(".photo-container").data("guillotine-height"));
    //var guillotine_width = 100;
	//var guillotine_height = 100;

    $('#upload').change(function(event){
	  $(".photo-container").html("<img src='' style='display:none;' id='product-image'/>");
      $(".photo-container img").load(function(){
        $('#product-image').guillotine({
          onChange: function(data, action){
            $('#scale').val(data.scale);
            $('#angle').val(data.angle);
            $('#x_axis').val(data.x);
            $('#y_axis').val(data.y);
            $('#width').val(data.w);
            $('#height').val(data.h);
          },
          width: guillotine_width,
          height: guillotine_height

        });
        var init_data = $('#product-image').guillotine('getData');
        $('#scale').val(init_data.scale);
        $('#angle').val(init_data.angle);
        $('#x_axis').val(init_data.x);
        $('#y_axis').val(init_data.y);
        $('#width').val(init_data.w);
        $('#height').val(init_data.h);  
        $('#guillotine-controls').show();
        $('.photo-container').show();
      }).attr('src',URL.createObjectURL(event.target.files[0]));  //displays image when selected with file_field
      $(".photo-container img").show();
    });

    $('#rotate_left').click(function(){
       $('#product-image').guillotine('rotateLeft');
       $('#product-image').guillotine('fit');
    });
    $('#fit').click(function(){
       $('#product-image').guillotine('fit');
    });
    $('#zoom_in').click(function(){
       $('#product-image').guillotine('zoomIn');
    });
    $('#rotate_right').click(function(){
       $('#product-image').guillotine('rotateRight');
       $('#product-image').guillotine('fit');
    });
    $('#zoom_out').click(function(){
       $('#product-image').guillotine('zoomOut');
    });
});


