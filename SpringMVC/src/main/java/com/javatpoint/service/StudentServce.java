package com.javatpoint.service;

import com.javatpoint.model.Student;

import java.sql.SQLException;
import java.util.List;

public interface StudentServce {

    public Student login(String userName,String password,String userType) throws Exception;

    public String register(Student student);

    public List<String> fetchAllStudentNames();

    public List<Student> fetchAllStudent() throws SQLException;

    public Student getStudentByName(String firstName) throws SQLException;

}
