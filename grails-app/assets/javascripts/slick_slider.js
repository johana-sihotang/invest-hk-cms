document.addEventListener("DOMContentLoaded", function () {
    const sliders = document.querySelectorAll('.panel__section__slider');

    sliders.forEach(slider => {
        const track = slider.querySelector('.slick-track');
        const slides = Array.from(track.querySelectorAll('.panel__section__inner'));
        const dots = slider.querySelectorAll('.slick-dots button');

        let currentIndex = 0;

        function showSlide(index) {
            slides.forEach((slide, i) => {
                // Tampilkan hanya slide aktif
                slide.style.display = i === index ? 'block' : 'none';
                slide.classList.toggle('slick-active', i === index);
                slide.classList.toggle('slick-current', i === index);
                slide.setAttribute('aria-hidden', i !== index ? 'true' : 'false');
                slide.tabIndex = i === index ? 0 : -1;
            });

            // Update dot style
            dots.forEach((dot, i) => {
                dot.setAttribute('aria-selected', i === index ? 'true' : 'false');
                dot.parentElement.classList.toggle('slick-active', i === index);
            });

            currentIndex = index;
        }

        // Inisialisasi: tampilkan slide pertama saja
        slides.forEach((slide, i) => {
            slide.style.display = i === 0 ? 'block' : 'none';
        });

        showSlide(0);

        // Event klik pada dot
        dots.forEach((dot, i) => {
            dot.addEventListener('click', () => {
                showSlide(i);
            });
        });
    });
});

