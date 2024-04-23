package com.javatpoint.service;

import com.javatpoint.model.Student;
import com.javatpoint.repo.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentServce {


    @Autowired
    StudentDao dao;

    @Override
    public Student login(String username, String password,String userType) throws Exception {
        //logic here
        return dao.login(username, password, userType);

    }

    @Override
    public String register(Student student) {

        return dao.save(student);
    }

    @Override
    public List<String> fetchAllStudentNames() {
        return null;
    }

    @Override
    public List<Student> fetchAllStudent() throws SQLException {

      return  dao.fetchAllStudents();
    }

    @Override
    public Student getStudentByName(String firstName) throws SQLException {
        return dao.getStudentsByName(firstName);
    }


}
