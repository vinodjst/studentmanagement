
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


</style>
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


<center>

<table border="1" style="margin-top:30px;background-color:wheat">
<tr><th>First Name</th><th>Middle Name</th><th>Last Name</th><th>Course</th><th>Gender</th><th>Country Code</th><th>Phone</th><th>Address</th><th>Email</th><th>EDIT</th><th>DELETE</th></tr>
<c:forEach var="student" items="${studentList}">
    <tr><td>${student.firstname}</td><td>${student.middlename}</td><td>${student.lastname}</td><td>${student.course}</td><td>${student.gender}</td><td>${student.countrycode}</td><td>${student.phone}</td><td>${student.address}</td><td>${student.email}</td><td><a href="#">EDIT</a></td><td><a href="${pageContext.request.contextPath}/removeStudent/${student.id}">DELETE</a></td></tr>
</c:forEach>


</table>
<p style="color:blue;">${deleteResponse}</p>
</center>

</section>

<footer></footer>




</center>
</body>
</html>
