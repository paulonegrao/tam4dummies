$(document).on("page:change", function() {
    $("#tam-dummit").on("click", function() {
      var tam_obj = $('#on-off-air');
      if (tam_obj.hasClass('on-air')) {
        // t4dcode: if "event_live_id" = "on-off-air data-live" & current page is = "on-off-air onclick" -> go DUMMIT; else alert msgs
        if ($('#event_live_id').attr('value') == tam_obj.attr('data-live') && window.location.href.includes(tam_obj.attr('onclick'))) {
            $("#dummit-new-1").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
            $("#dummit-new-2").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
            $("#dummit-new-3").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
            $("#dummit-new-section").removeClass("hidden");
            $("#dummit-grid-section").removeClass("hidden");
          } else {
            alert("This stream is not being currently captured. Go to " + $('#on-off-air').attr('onclick') + ", or click the ON-AIR button as a shortcut");
          }
        } else {
          alert("Nothing is being captured at this moment (ON-AIR sign if off).");
        }
    });
    $("#dummit-new-1").on("click", function() {
        $("#dummit-new-1").addClass("hidden");
        $("#dummit-new-2").removeClass("hidden");
        var captureDate = $("#on-off-air").attr("data-live-capture-date");
        var dummitShot = (Date() - captureDate);
        $("#dummit_shot").attr("value", dummitShot);
        $("#dummit_shot_short").html(dummitShot.toLocaleFormat('%H-%M-%S'));
        $("#dummit_body").focus();
    });
});
