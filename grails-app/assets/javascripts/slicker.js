function updateDotsPosition() {
    var currentSlide = $('.indexCarousellTop .slick-current');
    var readMore = currentSlide.find('nav.link a:contains("Read More")');
    var dots = $('.slick-dots');
    var carousel = $('.indexCarousellTop');

    if (readMore.length && dots.length && carousel.length) {
        var readMoreOffset = readMore.offset();
        var carouselOffset = carousel.offset();

        // hitung posisi readMore relatif ke carousel
        var relativeTop = readMoreOffset.top - carouselOffset.top;
        var relativeLeft = readMoreOffset.left - carouselOffset.left;

        var readMoreHeight = readMore.outerHeight();

        dots.css({
            position: 'absolute',
            top: relativeTop + readMoreHeight + 10,
            left: relativeLeft,
            bottom: 'auto',
        });
    }
}

$('.indexCarousellTop').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    infinite: true,
    arrows: true,
    dots: true,
    autoplay: false,
    autoplaySpeed: 4000,
    adaptiveHeight: true,
    // appendDots: $('.index__section__paragraph'),
    // appendArrows: $('.index__section__paragraph')
});

$(document).ready(function () {
    updateDotsPosition();
    $(window).on('resize', function () {
        updateDotsPosition();
    });

    $('.indexCarousellTop').on('afterChange', function(event, slick, currentSlide) {
        updateDotsPosition();
    });
});

$(window).on('resize', function () {
    updateDotsPosition();
});


$('.panel__section__slider').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    infinite: true,
    arrows: false,
    dots: true,
    autoplay: false,
    autoplaySpeed: 4000,
    adaptiveHeight: true,
    // appendDots: $('.index__section__paragraph'),
    // appendArrows: $('.index__section__paragraph')
});