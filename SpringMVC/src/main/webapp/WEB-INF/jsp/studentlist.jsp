
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
  <li><a href="#service">News</a></li>
  <li><a href="#contact">Contact</a></li>
  <li><a href="#about">About</a></li>
</ul>

</nav>

<section>

<center>
<table border="1" style="margin-top:30px;background-color:wheat">
<tr><th>First Name</th><th>Middle Name</th><th>Last Name</th><th>Course</th><th>Gender</th><th>Country Code</th><th>Phone</th><th>Address</th><th>Email</th><th>EDIT</th><th>DELETE</th></tr>
<c:forEach var="student" items="${studentList}">
    <tr><td>${student.firstname}</td><td>${student.middlename}</td><td>${student.lastname}</td><td>${student.course}</td><td>${student.gender}</td><td>${student.countrycode}</td><td>${student.phone}</td><td>${student.address}</td><td>${student.email}</td></tr>
</c:forEach>


</table>

</center>

</section>

<footer></footer>




</center>
</body>
</html>
