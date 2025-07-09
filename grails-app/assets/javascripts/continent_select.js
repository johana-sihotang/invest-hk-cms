// $(document).ready(function() {
//     $('#location-select').prop('disabled', true);
// });
//
// $('#continent-select').on('change', function() {
//     const continentId = $(this).val();
//     const locationSelect = $('#location-select');
//
//     locationSelect.empty();
//
//     if (continentId) {
//         $.ajax({
//             url: '/contactUs/locationsByContinent',
//             method: 'GET',
//             data: { continentId: continentId },
//             success: function(data) {
//                 locationSelect.prop('disabled', false); // enable setelah data didapat
//                 data.forEach(function(location) {
//                     locationSelect.append(
//                         $('<option></option>').val(location.id).text(location.name)
//                     );
//                 });
//             },
//             error: function() {
//                 alert('Failed to load locations.');
//                 locationSelect.prop('disabled', true); // tetap disable kalau error
//             }
//         });
//     } else {
//         locationSelect.prop('disabled', true);
//     }
// });

    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}


window.onclick = function(event) {
    // Jika elemen yang diklik bukan tombol dropdown DAN bukan bagian dari dropdown
    if (!event.target.matches('.dropbtn') && !event.target.closest('.dropdown-content')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}