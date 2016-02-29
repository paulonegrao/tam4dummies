$(document).ready(function(){
  // $.get("http://localhost:3999/index", function(data){
  //   for(var i = 0; i < data.length; i++) {
  //     $("#messages").prepend("<div>" + data[i].body + "</div><hr>");
  //   }
  // });

  setInterval(function(){
    $.ajax({
      url: "http://localhost:3999/index",
      method: "GET",
      error: function(){
              console.log("Problem connecting to server!");
            },
      success: function(data){
                 $("#messages").html("");
                 for(var i = 0; i < data.length; i++) {
                   $("#messages").prepend("<div>" + data[i].body + "</div><hr>");
                 }
               }
    })
  }, 2000);

  $(".message-form").on("submit", function(event){
    event.preventDefault();
    $.post("http://localhost:3900/messages",
           {body: $("#message").val()}, function(){
             $("#messages").prepend("<div>" + $("#message").val() + "</div><hr>");
             $("#message").val("");
           });
  });
});
