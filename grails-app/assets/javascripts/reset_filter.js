function resetFilters(event) {
    event.preventDefault();
    const form = document.querySelector('form');

    // Reset field di form secara visual
    form.reset();
    form.querySelectorAll('select').forEach(select => {
        select.selectedIndex = 0;
    });
    const searchInput = form.querySelector('input[name="searchNewsPress"]');
    if (searchInput) searchInput.value = '';

    // Hilangkan semua parameter di URL sebelum submit ulang form
    const url = window.location.pathname; // hanya ambil path tanpa query string
    window.location.href = url; // redirect ke url bersih, ini memaksa reload di page sekarang dengan filter kosong
}
