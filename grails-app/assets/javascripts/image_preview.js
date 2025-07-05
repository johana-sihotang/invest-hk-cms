document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('input[type="file"][accept*="image"]').forEach(function (input) {
        input.addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function (e) {
                const inputId = input.id; // e.g., "startImages[0]" or "sliderImages[0]"
                const previewImg = document.getElementById(`imagePreview-${inputId}`);
                const previewArea = document.getElementById(`previewArea-${inputId}`);

                if (previewImg) {
                    previewImg.src = e.target.result;
                    previewImg.classList.remove('hidden');
                }

                if (previewArea) {
                    previewArea.classList.add('hidden');
                }
            };
            reader.readAsDataURL(file);
        });
    });
});
