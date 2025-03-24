document.addEventListener("DOMContentLoaded", function () {
    const fromDateInput = document.getElementById("fromDate");
    const toDateInput = document.getElementById("toDate");
    const form = document.querySelector("form");

    // Tạo vùng hiển thị số ngày nghỉ
    const resultBox = document.createElement("div");
    resultBox.className = "alert alert-info mt-3";
    resultBox.style.display = "none";
    form.appendChild(resultBox);

    function calculateDays() {
        const fromDate = new Date(fromDateInput.value);
        const toDate = new Date(toDateInput.value);

        if (fromDate && toDate && toDate >= fromDate) {
            const diffTime = toDate.getTime() - fromDate.getTime();
            const days = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
            resultBox.innerText = `Số ngày nghỉ: ${days} ngày.`;
            resultBox.style.display = "block";
        } else {
            resultBox.style.display = "none";
        }
    }

    fromDateInput.addEventListener("change", calculateDays);
    toDateInput.addEventListener("change", calculateDays);

    form.addEventListener("submit", function (e) {
        const from = new Date(fromDateInput.value);
        const to = new Date(toDateInput.value);

        if (to < from) {
            e.preventDefault();
            alert("Ngày kết thúc không được nhỏ hơn ngày bắt đầu!");
        }
    });
});
