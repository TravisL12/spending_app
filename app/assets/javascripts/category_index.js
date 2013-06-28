$(document).ready(function(){
  
  // Spinner gif
  $('.submit_search').click(function(){
    $('.category_index').html("");
    $('.category_waiting').show();
  });
  
  // Load Category of Spending
  $('.profile_choices').on('ajax:success', function(event, data, success, xhr){
    $('.category_waiting').hide();
    $('.category_index').html(data.category_page);
  });
  
  $(document).on('ajax:success', 'a.category_name', function(e, data, success, xhr){
    $('.category_overview').fadeIn('slow').html(data.cat_summary);
  });
  
  $('.category_overview').on('click', '.close_box', function(){
    $('.category_overview').fadeOut('fast');
  });

});