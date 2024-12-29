<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Appointment</title>
    <%@include file="component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                        url("img/hospital.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <%-- Include Navbar --%>
    <%@include file="component/navbar.jsp"%>

    <%-- Redirect to login if the user is not logged in --%>
    <c:if test="${empty userObj}">
        <c:redirect url="user_login.jsp"></c:redirect>
    </c:if>

    <div class="container-fulid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <%-- Image Section --%>
            <div class="col-md-6 p-5">
                <img src="img/doct.jpg" alt="Doctor" class="img-fluid rounded">
            </div>

            <%-- Appointment Form Section --%>
            <div class="col-md-6">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-3">User Appointment</p>

                        <%-- Error or Success Messages --%>
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-5 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="fs-5 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <form class="row g-3" action="appAppointment" method="post">
                            <%-- Hidden User ID Field --%>
                            <input type="hidden" name="userid" value="${userObj.id}">

                            <%-- Full Name Input --%>
                            <div class="col-md-6">
                                <label for="fullname" class="form-label">Full Name</label>
                                <input required type="text" id="fullname" class="form-control" name="fullname">
                            </div>

                            <%-- Gender Dropdown --%>
                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <select id="gender" class="form-control" name="gender" required>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>

                            <%-- Age Input --%>
                            <div class="col-md-6">
                                <label for="age" class="form-label">Age</label>
                                <input required type="number" id="age" class="form-control" name="age">
                            </div>

                            <%-- Appointment Date Input --%>
                            <div class="col-md-6">
                                <label for="appoint_date" class="form-label">Appointment Date</label>
                                <input type="date" id="appoint_date" class="form-control" required name="appoint_date">
                            </div>

                            <%-- Email Input --%>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input required type="email" id="email" class="form-control" name="email">
                            </div>

                            <%-- Phone Number Input --%>
                            <div class="col-md-6">
                                <label for="phno" class="form-label">Phone No</label>
                                <input maxlength="10" required type="text" id="phno" class="form-control" name="phno">
                            </div>

                            <%-- Diseases Input --%>
                            <div class="col-md-6">
                                <label for="diseases" class="form-label">Diseases</label>
                                <input required type="text" id="diseases" class="form-control" name="diseases">
                            </div>

                            <%-- Doctor Dropdown --%>
                            <div class="col-md-6">
                                <label for="doctor" class="form-label">Doctor</label>
                                <select id="doctor" required class="form-control" name="doct">
                                    <option value="">--Select--</option>
                                    <%
                                    DoctorDao doctorDao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> doctors = doctorDao.getAllDoctor();
                                    for (Doctor doctor : doctors) {
                                    %>
                                    <option value="<%=doctor.getId()%>">
                                        <%=doctor.getFullName()%> (<%=doctor.getSpecialist()%>)
                                    </option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <%-- Address Text Area --%>
                            <div class="col-md-12">
                                <label for="address" class="form-label">Full Address</label>
                                <textarea required id="address" name="address" class="form-control" rows="3"></textarea>
                            </div>

                            <%-- Submit Button --%>
                            <div class="col-md-12 text-center">
                                <button class="btn btn-success" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Include Footer --%>
    <%@include file="component/footer.jsp"%>
</body>
</html>
