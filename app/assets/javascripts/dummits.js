$(document).on("page:change", function() {
    $("#tam-dummit").on("click", function() {
      if ($("#dummit-grid-section").hasClass("hidden")) {
          var tam_obj = $('#on-off-air');
          if (tam_obj.hasClass('on-air')) {
            // t4dcode: if "event_live_id" = "on-off-air data-live" & current page is = "on-off-air onclick" -> go DUMMIT; else alert msgs
            if ($('#event_live_id').attr('value') == tam_obj.attr('data-live') && window.location.href.includes(tam_obj.attr('onclick'))) {
                $("#dummit-new-1").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
                $("#dummit-new-2").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
                $("#dummit-new-3").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
                $("#dummit-grid-section").removeClass("hidden");
                $("#dummit-new-section").removeClass("hidden");
                $("#video_tam").addClass("video50");
              } else {
                alert("This stream is not being currently captured. Go to " + $('#on-off-air').attr('onclick') + ", or click the ON-AIR button as a shortcut");
              }
          } else {
              alert("Nothing is being captured at this moment (ON-AIR sign if off).");
          }
      } else {
          $("#video_tam").removeClass("video50");            $("#dummit-grid-section").addClass("hidden");
          $("#dummit-new-section").addClass("hidden");
      }
    });
    $("#dummit-new-1").on("click", function() {
        var captureDate = new Date($("#on-off-air").attr("data-live-capture-date"));
        var dateNow     = new Date(Date());
        var miliSeconds = (dateNow - captureDate);
        var seconds     = "00" + (miliSeconds/1000)%60;
        var secondsW    = seconds.substr(seconds.length-2);
        var minutes     = "00" + parseInt((miliSeconds/(1000*60))%60);
        var minutesW    = minutes.substr(minutes.length-2);
        var hours       = "00" + parseInt((miliSeconds/(1000*60*60)));
        var hoursW      = hours.substr(hours.length-2);
        $("#dummit_date").attr("value", dateNow);
        $("#dummit_title").attr("value", hoursW + ":" + minutesW + ":" + secondsW);
        $("#dummit-new-1").addClass("hidden");
        $("#dummit-new-2").removeClass("hidden");
        $("#dummit_body").focus();
    });
});
