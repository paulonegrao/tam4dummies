var globalTimeout;
var eventInterval;

$(document).on("page:change", function() {
  $(".dropdown").on("shown.bs.dropdown", function() {
    $(".navlink.open").removeClass("open");
  });

  $(".dropdown").on("hidden.bs.dropdown", function() {
    $(".navlink").addClass("open");
  });

// td4.s01 - fires AJAX to refresh ON-AIR icon (@ _nav.html.erb)
  // clearInterval(eventInterval);
  // eventInterval = setInterval( function() {
  //   document.getElementById('tam-event-keep-alive').click(); //fake a click on the link
  // }, 3000);

  function loopKeepAlive() {
    document.getElementById('tam-event-keep-alive').click(); //fake a click on the link
    setTimeout(loopKeepAlive, 3000);
  };
  loopKeepAlive();

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
