package com.javatpoint.controller;

import com.javatpoint.model.Student;
import com.javatpoint.service.StudentServce;
import com.mysql.cj.protocol.x.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class StudentController {

    @Autowired
    StudentServce studentServce;


    /*shows the register page*/
    @GetMapping("/showregister")
    public String registerUser() {

        return "register";
    }


    /* Save student data into db*/
    @PostMapping(value = "/register")
    public String register(Student register, Model model) {

        System.out.println("Request body :::" + register);

        String response = studentServce.register(register);

        if (response.equalsIgnoreCase("Saved")) {
            model.addAttribute("result", "Registered Successfully...");
        } else {
            model.addAttribute("result", "Registered Failed");

        }

        return "success";
    }


    /*shows the login page*/
    @GetMapping("/showlogin")
    public String showLogin() {

        return "login";
    }

    /* Verify's the login creds provided by the user */
    @PostMapping(value = "/login")
    public String login(@RequestParam(name = "uname") String userName, @RequestParam(name = "psw") String password, @RequestParam(name = "usertype") String userType, Model model, HttpSession session) {

        

        Student response = null;
        try {
            response = studentServce.login(userName, password, userType);
        } catch (Exception e) {
            model.addAttribute("error", "Invalid UserName/Password! Please provide valid credentials...");
            return "login";
        }

        if (response != null) {
            session.setAttribute("loguser",response.getFirstname());
            return "redirect:homepage?user=" + response.getFirstname() + "&usertype=" + response.getUsertype();
        } else {
            model.addAttribute("error", "Invalid UserName/Password!");
            return "login";
        }
    }


    @GetMapping("/homepage")
    public String showStudents(@RequestParam(name = "user") String user, @RequestParam(name = "usertype") String userType, Model model) {
        model.addAttribute("user",user);
        if (userType.equalsIgnoreCase("student"))
            return "userhome";
        else
            return "adminhome";

    }


    @GetMapping("/fetchstudentbyname/{name}")
    public String fetchStudentDetailsByName(@PathVariable(name = "name") String name,Model model){

        Student studentByName=null;
        try {
             studentByName = studentServce.getStudentByName(name);
        } catch (SQLException e) {
            System.out.println("Error while fetch data.....!");
        }

        model.addAttribute("profileflag",true);
        model.addAttribute("profile",studentByName);
        return "userhome";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session){

        session.invalidate();;
        return "redirect:index.jsp";
    }


    @GetMapping("/studentlist")
    public String showStudents(Model model) throws SQLException {

        List<Student> students = studentServce.fetchAllStudent();

        if (students.size() > 0) {

            model.addAttribute("studentList", students);
        } else {
            model.addAttribute("nodata", "No records available");
        }

        return "studentlist";

    }



    @RequestMapping("/removeStudent/{id}")
    public String deleteUser(@PathVariable(name = "id") int id,Model model){
        String response = studentServce.deleteStudent(id);
        model.addAttribute("deleteResponse",response);

        return "redirect:/studentlist";
    }

}
