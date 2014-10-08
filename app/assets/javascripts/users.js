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
        $("#photos-number").text(Number($("#photos-number").text())+1 )
      })
    handler.preventDefault();
  });


})