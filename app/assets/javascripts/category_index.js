$(document).ready(function(){
  $('.profile_choices').on('ajax:success', function(event, data, success, xhr){
    console.log(data);
    $('.category_index').text(data)
  });
});