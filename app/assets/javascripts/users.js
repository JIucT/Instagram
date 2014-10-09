$(document).ready( function() {
  $("#submit-login").click( function() {
    $.post("/users/sign_in", {
      user: { 
        email: $("#login-form #email").val(),
        password: $("#login-form #password").val(),
        remember_me: $("#login-form #user_remember_me").val()
      }       
    }, function(data) {
      window.history.pushState("", "", '/');
        document.write(data);
        document.close();
    }, 'html')
      .fail(function(data) {
        $(".center-window").css("height", "303px");
        $(".alert").text(data.responseText);
        $(".alert").show("slow");
      })
  })

  $("#user-data .filestyle").change( function() {
    $("#photo-upload-from").submit();
    $(this).val("");
  })

  $("#photo-upload-from").submit( function(handler) {
    $.ajax( {
      url: '/photos/create',
      type: 'POST',
      data: new FormData( this ),
      processData: false,
      contentType: false
    })
      .done( function(data) {
        $(".user-photos").replaceWith(data);
        $("#photos-number").text(parseInt($("#photos-number").text())+1 )
      })
    handler.preventDefault();
  });

  bindButtons();

})

function bindButtons() {
  $("#av-btn-follow").click( function() {
    $.post("/users/addfollower/"+parseInt(window.user.id), {
      id: parseInt(window.user.id)
    })
    .done( function(data) {
      $("#av-btn-follow").replaceWith(data);  
      bindButtons();    
    })    
  })

  $("#av-btn-following").click( function() {
    $.ajax({
      url: "/users/unfollow/"+parseInt(window.user.id),
      type: 'DELETE',
      data: { id: parseInt(window.user.id) }
    })
    .done( function(data) {
      $("#av-btn-following").replaceWith(data);
      bindButtons(); 
    })    
  })
}