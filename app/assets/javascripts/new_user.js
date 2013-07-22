$(document).on('ajax:complete', '#new_user', function(event, xhr, status){
  var response = xhr.responseJSON
  if (status === "error"){
    $(this).replaceWith(response.html);
  }else{
    location.replace(response.redirect_to);
  }
})
