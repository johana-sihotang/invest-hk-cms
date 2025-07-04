$(document).ready(function() {
    function setupHeader() {
        if ($(window).width() < 992) {
            $('.icon-hide').stop(true, true).slideUp();
        } else {
            $('.icon-hide').stop(true, true).slideDown();
        }
    }

    setupHeader();

    var resizeTimer;
    $(window).on('resize', setupHeader);
});
