document.addEventListener('DOMContentLoaded', function () {
    setupBannerAdd();
    setupStartSectionAdd();
    setupSliderAddButton();
});

function setupBannerAdd() {
    const addBannerBtn = document.getElementById('addBannerBtn');
    const newsSelectionContainer = document.getElementById('newsSelectionContainer');

    if (!addBannerBtn || !newsSelectionContainer) return;

    addBannerBtn.addEventListener('click', function () {
        const selectGroups = newsSelectionContainer.querySelectorAll('.news-select-group');
        const newIndex = selectGroups.length;

        const firstSelect = selectGroups[0];
        if (!firstSelect) return;

        const newSelectGroup = firstSelect.cloneNode(true);
        const selectElement = newSelectGroup.querySelector('select');

        // Update name and id for uniqueness
        if (selectElement) {
            selectElement.name = `selectedNewsIds[${newIndex}]`;
            selectElement.id = `selectedNewsIds_${newIndex}`;
            selectElement.selectedIndex = 0;
        }

        // Update label if exists
        const label = newSelectGroup.querySelector('label');
        if (label && selectElement) {
            label.setAttribute('for', selectElement.id);
        }

        // Remove old remove button
        const oldRemoveBtn = newSelectGroup.querySelector('.remove-banner-btn');
        if (oldRemoveBtn) oldRemoveBtn.remove();

        // Add new remove button
        const removeBtn = document.createElement('button');
        removeBtn.type = 'button';
        removeBtn.innerHTML = "<i class=\"bi bi-trash3-fill\"></i>";
        removeBtn.className = 'remove-banner-btn text-red-600 hover:text-red-800 font-bold text-lg ml-2';
        removeBtn.addEventListener('click', function () {
            newSelectGroup.remove();
        });

        newSelectGroup.appendChild(removeBtn);
        newsSelectionContainer.appendChild(newSelectGroup);
    });
}

function setupStartSectionAdd() {
    const addStartBtn = document.getElementById('addStartSectionBtn');
    const container = document.getElementById('startSectionContainer');
    const template = document.getElementById('startSectionTemplate');

    if (!addStartBtn || !container || !template) return;

    let startIndex = 0;

    function addStartSection() {
        const clone = template.cloneNode(true);
        clone.classList.remove('hidden');
        clone.removeAttribute('id');

        // Update caption and file input name + id
        const captionInput = clone.querySelector('input[name="startCaptions"]');
        const fileInput = clone.querySelector('input[type="file"]');

        if (captionInput) {
            captionInput.name = `startCaptions[${startIndex}]`;
            captionInput.id = `startCaption_${startIndex}`;
        }

        if (fileInput) {
            fileInput.name = `startImages[${startIndex}]`;
            fileInput.id = `startImage_${startIndex}`;
        }

        // Update label 'for' attribute
        const label = clone.querySelector('label');
        if (label && captionInput) {
            label.setAttribute('for', captionInput.id);
        }

        // Trigger any preview/file input JS needed here
        // Example: reinitialize dropzone or file preview, if needed
        // initDropzone(fileInput); <-- if you're using a custom dropzone

        container.appendChild(clone);
        startIndex++;
    }

    addStartBtn.addEventListener('click', addStartSection);
    addStartSection(); // default satu input muncul
}

function setupSliderAddButton() {
    const addSliderBtn = document.getElementById('addSliderBtn');
    const slidersWrapper = document.getElementById('slidersWrapper');
    const sliderWrapperTemplate = document.getElementById('sliderWrapperTemplate');
    const sliderContentTemplate = document.getElementById('sliderContentItemTemplate');

    if (!addSliderBtn || !slidersWrapper || !sliderWrapperTemplate || !sliderContentTemplate) return;

    let sliderIndex = 0;

    addSliderBtn.addEventListener('click', function () {
        const clone = sliderWrapperTemplate.cloneNode(true);
        clone.classList.remove('hidden');
        clone.removeAttribute('id');

        const typeSelect = clone.querySelector('.slider-type-select');
        const imageTemplate = clone.querySelector('.slider-image-template');
        const sliderTemplate = clone.querySelector('.slider-slider-template');
        const sliderItemsContainer = sliderTemplate.querySelector('.slider-items');
        const addSliderContentBtn = sliderTemplate.querySelector('.add-slider-content-btn');

        function handleTypeChange() {
            const value = typeSelect.value;
            imageTemplate.classList.toggle('hidden', value !== 'image');
            sliderTemplate.classList.toggle('hidden', value !== 'slider');
        }

        // Initial state
        typeSelect.addEventListener('change', handleTypeChange);
        handleTypeChange();

        // Slider content handler
        let contentIndex = 0;

        function addSliderContent() {
            const contentClone = sliderContentTemplate.cloneNode(true);
            contentClone.classList.remove('hidden');
            contentClone.removeAttribute('id');

            const input = contentClone.querySelector('input[name="sliderContents"]');
            if (input) {
                input.name = `sliderContents[${sliderIndex}][${contentIndex}]`;
            }

            sliderItemsContainer.appendChild(contentClone);
            contentIndex++;
        }

        addSliderContentBtn.addEventListener('click', addSliderContent);

        slidersWrapper.appendChild(clone);
        sliderIndex++;
    });
}
