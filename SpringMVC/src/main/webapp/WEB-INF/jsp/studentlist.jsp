
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

.editForm {
display:none;chr

}



</style>




<script>

function showRegister(id,fname,mname,lname,course,gender,countrycode,phone,address,email){

console.log("Name :::"+name);

alert("you clicked on edit....id "+name);

var element = document.getElementsByClassName('editForm')[0];

document.getElementsByName("id")[0].value =id;
document.getElementsByName("firstname")[0].value =fname;
document.getElementsByName("middlename")[0].value =mname;
document.getElementsByName("lastname")[0].value =lname;
document.getElementsByName("course")[0].value =course;
document.getElementsByName("gender")[0].value =gender;
document.getElementsByName("countrycode")[0].value =countrycode;
document.getElementsByName("phone")[0].value =phone;
document.getElementsByName("address")[0].value =address;
document.getElementsByName("email")[0].value =email;



console.log(element.style);
element.style.display = "block";
console.log(element.style);

}



function fetchStudentInfoById(){
//Ajax functionality to call a backed api

}

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


<center>

<table border="1" style="margin-top:30px;background-color:wheat">
<tr><th>First Name</th><th>Middle Name</th><th>Last Name</th><th>Course</th><th>Gender</th><th>Country Code</th><th>Phone</th><th>Address</th><th>Email</th><th>EDIT</th><th>DELETE</th></tr>
<c:forEach var="student" items="${studentList}">
    <tr><td>${student.firstname}</td><td>${student.middlename}</td><td>${student.lastname}</td><td>${student.course}</td><td>${student.gender}</td><td>${student.countrycode}</td><td>${student.phone}</td><td>${student.address}</td><td>${student.email}</td><td><a href="#" onclick="showRegister('${student.id}','${student.firstname}','${student.middlename}','${student.lastname}','${student.course}','${student.gender}','${student.countrycode}','${student.phone}','${student.address}','${student.email}')">EDIT</a></td><td><a href="${pageContext.request.contextPath}/removeStudent/${student.id}">DELETE</a></td></tr>
</c:forEach>


</table>
<p style="color:blue;">${deleteResponse}</p>


<!--EDIR FORM-->

<div class="editForm">
<form  action="register"  method="post" modelAttribute="register">

  <center>  <h1> UPDATE STUDENT</h1> </center>
  <hr>
  <table>

  <tr><td>Id :</td><td><input type="text" name="id" placeholder= "id" size="15" required /></td></tr>
  <tr><td>Firstname :</td><td><input type="text" name="firstname" placeholder= "Firstname" size="15" required /></td></tr>

  <tr><td>Middlename :</td><td><input type="text" name="middlename" placeholder="Middlename" size="15" required /></td></tr>


<tr><td>Lastname : </td><td><input type="text" name="lastname" placeholder="Lastname" size="15"required /></td></tr>


<tr><td>Course : </td><td><select name="course">
                                  <option value="Course">Course</option>
                                  <option value="BCA">BCA</option>
                                  <option value="BBA">BBA</option>
                                  <option value="B.Tech">B.Tech</option>
                                  <option value="MBA">MBA</option>
                                  <option value="MCA">MCA</option>
                                  <option value="M.Tech">M.Tech</option>
                                  </select>
</td></tr>


<tr><td>Gender :</td><td> <input type="radio" value="Male" name="gender" checked > Male
                 <input type="radio" value="Female" name="gender"> Female
                 <input type="radio" value="Other" name="gender"> Other
</td></tr>

<tr><td>Phone : </td><td><input type="text" name="countrycode" placeholder="Country Code"  value="+91" size="2"/>
                         <input type="text" name="phone" placeholder="phone no." size="10"/ required>

</td></tr>

<tr><td>Current Address :
 </td><td><textarea cols="80" rows="5" placeholder="Current Address" name="address" required>
          </textarea>

</td></tr>

<tr><td>Email :
 </td><td><input type="text" placeholder="Enter Email" name="email" required/>

</td></tr>



<tr><td>User Type :
 </td><td><select name="usertype">
                     <option value="">SELECT</option>
                     <option value="student">Student</option>
                     <option value="admin">Admin</option>
                     </select>
</td></tr>

<tr><td></td><td>    <button type="submit" class="registerbtn">Register</button>
</td></tr>

 </table>

</form>


</div>




</center>

</section>

<footer></footer>




</center>
</body>
</html>
