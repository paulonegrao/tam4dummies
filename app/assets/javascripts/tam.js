$(document).on("page:change", function() {
  $(".dropdown").on("shown.bs.dropdown", function() {
    $(".navlink.open").removeClass("open");
  });

  $(".dropdown").on("hidden.bs.dropdown", function() {
    $(".navlink").addClass("open");
  });
// fires AJAX to refresh ON-AIR icon
  setInterval(function(){
    document.getElementById('tam-event-keep-alive').click(); //fake a click on the link
    }, 3000);

});
// wait for DOM elements addition, if = '#video-tam' fires click loops
// of '#tam-event-keep-alive-video' to force (via AJAX) an event update
// $(document).bind('DOMNodeInserted', function(event) {
//   if (event.target.nodeName == 'VIDEO') {
//     if (event.target.id == 'video_tam') {
//       setInterval(function(){
//         document.getElementById('tam-event-keep-alive-video').click(); //fake a click on the link
//       }, 3000);
//     };
//   };
// });
