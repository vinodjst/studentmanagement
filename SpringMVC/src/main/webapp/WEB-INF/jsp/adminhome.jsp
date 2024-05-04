
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
<style>
header{

background-color:gray;
height:100px;
width:100%;
}
header h2 {

color: white;
text-align:center;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}

section button {



border-radius:10px;
margin-left:20px;
margin-top:20px;

}

.profile {

border:1px solid black;
background-color:wheat;
color:white;
font-size:15px;

width:30%;

}




</style>


<script>



</script>
</head>




<body>
<header>


<h2>STUDENT MANAGEMENT</h2>
</header>

<nav>
<ul>
  <li><a href="#home">Home</a></li>
  <li><a href="${pageContext.request.contextPath}/studentlist" >StudentList</a></li>
  <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
</ul>

</nav>

<section>

<p>Welcome <span style="font-size:22px;color:blue;"><i><span style="color:red">Admin</span> ${sessionScope.loguser}</i>!</span></p>


<c:if test="${profileflag}">

<center><div class="profile">
<h3>Profile</h3>
<table>
<tr><td>First Name :</td> <td>${profile.firstname}</td></tr>
<tr><td>Middle Name :</td><td>${profile.middlename}</td></tr>
<tr><td>Last Name :</td><td>${profile.lastname}</td></tr>
<tr><td>Course :</td><td>${profile.course}</td></tr>
<tr><td>Gender :</td><td>${profile.gender}</td></tr>
<tr><td>Phone :</td><td>${profile.phone}</td></tr>
<tr><td>Address :</td><td>${profile.address}</td></tr>
<tr><td>Email :</td><td>${profile.email}</td></tr>

</table>

</div>


</center>
</c:if>

</section>

<footer></footer>




</center>
</body>
</html>
