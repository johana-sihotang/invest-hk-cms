document.addEventListener("DOMContentLoaded", function () {
    const sliderContainer = document.querySelector(".indexCarousellTop .slick-track");
    const slides = sliderContainer.querySelectorAll(".slider");
    const dots = document.querySelectorAll(".slick-dots button");
    const prevBtn = document.querySelector(".slick-prev");
    const nextBtn = document.querySelector(".slick-next");

    let currentSlide = 0;

    // Set width based on number of slides
    const slideWidth = slides[0].offsetWidth;
    sliderContainer.style.width = `${slideWidth * slides.length}px`;

    function goToSlide(index) {
        currentSlide = index;

        // Geser slider
        sliderContainer.style.transform = `translate3d(-${slideWidth * index}px, 0, 0)`;

        // Set aktif class
        slides.forEach((slide, i) => {
            slide.classList.toggle("slick-active", i === index);
            slide.classList.toggle("slick-current", i === index);
            slide.setAttribute("aria-hidden", i === index ? "false" : "true");
            slide.tabIndex = i === index ? 0 : -1;
        });

        // Update dots
        dots.forEach((dot, i) => {
            dot.parentElement.classList.toggle("slick-active", i === index);
            dot.setAttribute("aria-selected", i === index);
        });
    }

    // Inisialisasi
    goToSlide(0);

    // Klik tombol dot
    dots.forEach((dot, i) => {
        dot.addEventListener("click", () => {
            goToSlide(i);
        });
    });

    // Klik tombol prev
    prevBtn.addEventListener("click", () => {
        const newIndex = currentSlide === 0 ? slides.length - 1 : currentSlide - 1;
        goToSlide(newIndex);
    });

    // Klik tombol next
    nextBtn.addEventListener("click", () => {
        const newIndex = currentSlide === slides.length - 1 ? 0 : currentSlide + 1;
        goToSlide(newIndex);
    });
});
