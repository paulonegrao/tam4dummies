$(document).on("page:change", function() {
    $("#tam-dummit").on("click", function() {
        $("#dummit-new-1").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
        $("#dummit-new-2").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
        $("#dummit-new-3").addClass($("#dummit-grid-tail a").css("content").slice(1, -1));
        $("#dummit-new-section").removeClass("hidden");
        $("#dummit-grid-section").removeClass("hidden");
    });
    $("#dummit-new-1").on("click", function() {
        $("#dummit-new-1").addClass("hidden");
        $("#dummit-new-2").removeClass("hidden");
        $("#dummit-new-2-tarea").focus();
    });
});
