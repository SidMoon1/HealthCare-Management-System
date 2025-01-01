<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Registration</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.error-message {
    color: red;
    font-size: 0.9em;
}
</style>
<script>
    function validateSignupForm() {
        // Get form fields
        const fullName = document.getElementById("fullname").value.trim();
        const email = document.getElementById("email").value.trim();
        const password = document.getElementById("password").value.trim();
        const confirmPassword = document.getElementById("confirmPassword").value.trim();
        const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

        // Reset error messages
        document.getElementById("fullnameError").textContent = "";
        document.getElementById("emailError").textContent = "";
        document.getElementById("passwordError").textContent = "";
        document.getElementById("confirmPasswordError").textContent = "";

        let isValid = true;

        // Validate full name
        if (fullName === "") {
            document.getElementById("fullnameError").textContent = "Full Name is required.";
            isValid = false;
        }

        // Validate email
        if (!email.match(emailPattern)) {
            document.getElementById("emailError").textContent = "Invalid email format.";
            isValid = false;
        }

        // Validate password
        if (!password.match(passwordPattern)) {
            document.getElementById("passwordError").textContent = "Password must be at least 8 characters long, include at least one letter, one number, and one special character.";
            isValid = false;
        }

        // Validate confirm password
        if (password !== confirmPassword) {
            document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
            isValid = false;
        }

        return isValid;
    }
</script>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">User Register</p>

                        <c:if test="${not empty sucMsg }">
                            <p class="text-center text-success fs-3">${sucMsg}</p>
                            <c:remove var="sucMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg }">
                            <p class="text-center text-danger fs-3">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <form action="user_register" method="post" onsubmit="return validateSignupForm();">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label> 
                                <input id="fullname" name="fullname" type="text" class="form-control">
                                <span id="fullnameError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email address</label> 
                                <input id="email" name="email" type="email" class="form-control">
                                <span id="emailError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label> 
                                <input id="password" name="password" type="password" class="form-control">
                                <span id="passwordError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Confirm Password</label> 
                                <input id="confirmPassword" type="password" class="form-control">
                                <span id="confirmPasswordError" class="error-message"></span>
                            </div>
                            <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
