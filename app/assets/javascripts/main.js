$(document).ready(function(){
  $('.resource-rows').on('mouseenter', function(){
    $(this).addClass('highlight');
  });
  $('.resource-rows').on('mouseleave', function(){
    $(this).removeClass('highlight');
  });
});
