const imageInput = document.getElementById("imageFile");
const preview = document.getElementById("imagePreview");
const previewArea = document.getElementById("previewArea");
const uploadText = document.getElementById("uploadText");

imageInput.addEventListener("change", function () {
    const file = this.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function (e) {
            preview.src = e.target.result;
            preview.classList.remove("hidden");
            previewArea.classList.add("hidden");
        };

        reader.readAsDataURL(file);
    } else {
        preview.src = "";
        preview.classList.add("hidden");
        previewArea.classList.remove("hidden");
    }
});