$(document).ready(function() {
    $('#location-select').prop('disabled', true);
});

$('#continent-select').on('change', function() {
    const continentId = $(this).val();
    const locationSelect = $('#location-select');

    locationSelect.empty();

    if (continentId) {
        $.ajax({
            url: '/contactUs/locationsByContinent',
            method: 'GET',
            data: { continentId: continentId },
            success: function(data) {
                locationSelect.prop('disabled', false); // enable setelah data didapat
                data.forEach(function(location) {
                    locationSelect.append(
                        $('<option></option>').val(location.id).text(location.name)
                    );
                });
            },
            error: function() {
                alert('Failed to load locations.');
                locationSelect.prop('disabled', true); // tetap disable kalau error
            }
        });
    } else {
        locationSelect.prop('disabled', true);
    }
});
