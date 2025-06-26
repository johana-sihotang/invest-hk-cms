 let contentIndex = 0;

    document.getElementById('add-content').addEventListener('click', function () {
    const wrapper = document.getElementById('content-wrapper');

    const div = document.createElement('div');
    div.classList.add('grid', 'gap-4', 'md:grid-cols-2');

    div.innerHTML = `
        <div>
            <label class="block mb-2 text-sm font-medium text-gray-900">Content Title</label>
            <input type="text" name="content[${contentIndex}].title" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Sub Title" required>
        </div>
        <div>
            <label class="block mb-2 text-sm font-medium text-gray-900">Content</label>
            <textarea name="content[${contentIndex}].content" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500" placeholder="Sub Content" required></textarea>
        </div>
    `;
    wrapper.appendChild(div);
    contentIndex++;
});
