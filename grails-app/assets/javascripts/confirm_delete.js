
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("form.custom-delete-form").forEach(function (form) {
        form.addEventListener("submit", function (e) {
            e.preventDefault();
            const message = form.dataset.message || "Are you sure?";
            Swal.fire({
                title: 'Confirmation',
                text: message,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel',
                buttonsStyling: false,
                customClass: {
                    confirmButton: 'bg-red-600 hover:bg-red-700 text-white font-medium px-4 py-2 rounded m-3',
                    cancelButton: 'bg-gray-300 hover:bg-gray-400 text-black font-medium px-4 py-2 rounded'
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });
});
