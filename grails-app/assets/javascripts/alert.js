setTimeout(() => {
    const alertBox = document.getElementById("flash-alert");
    if (alertBox) {
        alertBox.classList.add("opacity-0");
        setTimeout(() => alertBox.remove(), 1000); // Hapus dari DOM setelah fade-out
    }
}, 5000);
