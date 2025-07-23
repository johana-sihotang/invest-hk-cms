document.addEventListener('DOMContentLoaded', function () {
    setupBannerAdd();
    setupStartSectionAdd();
    setupSliderAddButton();
});

function setupBannerAdd() {
    const addBannerBtn = document.getElementById('addBannerBtn');
    const newsSelectionContainer = document.getElementById('newsSelectionContainer');
    const selectGroups = newsSelectionContainer.querySelectorAll('.news-select-group');
    const firstSelect = selectGroups[0];

    if (firstSelect) {
        firstSelect.style.display = 'none';
    }

    if (!addBannerBtn || !newsSelectionContainer) return;

    let bannerIndex = 0;

    addBannerBtn.addEventListener('click', function () {
        const newIndex = bannerIndex++;

        const newSelectGroup = firstSelect.cloneNode(true);
        const selectElement = newSelectGroup.querySelector('select');
        const inputElement = newSelectGroup.querySelector('input');
        const labelElement = newSelectGroup.querySelector('label.input-news-title');
        const labelSelect = newSelectGroup.querySelector('label.select-news-title');

        // Update name dan id
        if (selectElement) {
            if (labelSelect) labelSelect.setAttribute('for', `banner_newsId_${newIndex}`);
            selectElement.name = `banner[${newIndex}].newsId`;
            selectElement.id = `banner_newsId_${newIndex}`;
            selectElement.selectedIndex = 0;

            $(document).ready(function () {
                $(`#banner_newsId_${newIndex}`).select2({
                    width: '100%'
                });
            });
        }

        if (inputElement) {
            inputElement.id = `banner_orderIndex_${newIndex}`;
            inputElement.setAttribute("value", `${newIndex}`);
        }

        if (labelElement) {
            labelElement.setAttribute("for", `banner_orderIndex_${newIndex}`);
        }

        newSelectGroup.style.display = '';

        //remove old button
        const oldRemoveBtn = newSelectGroup.querySelector('.remove-banner-btn');
        if (oldRemoveBtn) oldRemoveBtn.remove();

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
    const newsSelectionContainer = document.getElementById('startSelectionContainer');
    const selectGroups = newsSelectionContainer.querySelectorAll('.start-section-group');
    const firstSelect = selectGroups[0];

    if (!addStartBtn || !newsSelectionContainer) return;

    let startIndex = 0;

    addStartBtn.addEventListener('click', function () {
        const newIndex = startIndex++;

        const newStartGroup = firstSelect.cloneNode(true);
        const labelElement = startSelectGroup.querySelector('select');
        const inputElement = newSelectGroup.querySelector('input');
        const labelSelect = newSelectGroup.querySelector('label.select-news-title');

        // Update name dan id
        if (selectElement) {
            if (labelSelect) labelSelect.setAttribute('for', `banner_newsId_${newIndex}`);
            selectElement.name = `banner[${newIndex}].newsId`;
            selectElement.id = `banner_newsId_${newIndex}`;
            selectElement.selectedIndex = 0;

            $(document).ready(function () {
                $(`#banner_newsId_${newIndex}`).select2({
                    width: '100%'
                });
            });
        }

        if (inputElement) {
            inputElement.id = `banner_orderIndex_${newIndex}`;
            inputElement.setAttribute("value", `${newIndex}`);
        }

        if (labelElement) {
            labelElement.setAttribute("for", `banner_orderIndex_${newIndex}`);
        }

        newSelectGroup.style.display = '';

        //remove old button
        const oldRemoveBtn = newSelectGroup.querySelector('.remove-banner-btn');
        if (oldRemoveBtn) oldRemoveBtn.remove();

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

// function setupStartSectionAdd() {
//     const addStartBtn = document.getElementById('addStartSectionBtn');
//     const container = document.getElementById('startSectionContainer');
//     const template = document.getElementById('startSectionTemplate');
//
//     if (!addStartBtn || !container || !template) return;
//
//     let startIndex = 0;
//
//     function addStartSection() {
//         const clone = template.cloneNode(true);
//         clone.classList.remove('hidden');
//         clone.removeAttribute('id');
//
//         // Update caption and file input name + id
//         const captionInput = clone.querySelector('input[name="startCaptions"]');
//         const fileInput = clone.querySelector('input[type="file"]');
//
//         if (captionInput) {
//             captionInput.name = `startCaptions[${startIndex}]`;
//             captionInput.id = `startCaption_${startIndex}`;
//         }
//
//         if (fileInput) {
//             fileInput.name = `startImages[${startIndex}]`;
//             fileInput.id = `startImage_${startIndex}`;
//         }
//
//         // Update label 'for' attribute
//         const label = clone.querySelector('label');
//         if (label && captionInput) {
//             label.setAttribute('for', captionInput.id);
//         }
//
//         // Trigger any preview/file input JS needed here
//         // Example: reinitialize dropzone or file preview, if needed
//         // initDropzone(fileInput); <-- if you're using a custom dropzone
//
//         container.appendChild(clone);
//         startIndex++;
//     }
//
//     addStartBtn.addEventListener('click', addStartSection);
//     addStartSection(); // default satu input muncul
// }

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
