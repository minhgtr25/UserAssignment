document.addEventListener("DOMContentLoaded", function () {
    if (localStorage.getItem("rememberMe") === "true") {
        document.getElementById("username").value = localStorage.getItem("username");
        document.getElementById("password").value = localStorage.getItem("password");
        document.getElementById("rememberMe").checked = true;
    }
});

function validateLogin() {
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let rememberMe = document.getElementById("rememberMe").checked;

    if (rememberMe) {
        localStorage.setItem("username", username);
        localStorage.setItem("password", password);
        localStorage.setItem("rememberMe", "true");
    } else {
        localStorage.removeItem("username");
        localStorage.removeItem("password");
        localStorage.removeItem("rememberMe");
    }

    return true;
}
