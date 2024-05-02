package com.javatpoint.repo;

import com.javatpoint.model.Student;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StudentDao {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }


    public String save(Student student) {

        String sql = "insert into studentdetails(firstname,middlename,lastname,course,gender,countrycode,phone,address,email,psw,userType) " +
                "values('" + student.getFirstname() + "','" + student.getMiddlename() + "','" + student.getLastname() + "','" + student.getCourse() + "','" + student.getGender() + "','" + student.getCountrycode() + "','" + student.getPhone() + "','" + student.getAddress() + "','" + student.getEmail() + "','" + student.getPsw() + "','" + student.getUsertype() + "')";

        template.update(sql);

        return "Saved";
    }

    public String update(Student student) {

        String sql = "update studentdetails set phone='"+student.getPhone()+"' where name="+student.getFirstname();

        template.update(sql);

        return "student updated";
    }

    public String delete(int id) {

        String sql = "delete from studentdetails where id="+id;

        template.update(sql);

        return "student deleted successfully..";
    }

    public Student getStudentsByName(String studentName)
            throws SQLException {
        String sql
                = "select * from studentdetails where firstname=?";
        return template.queryForObject(
                sql, new Object[]{studentName},
                new BeanPropertyRowMapper<Student>(
                        Student.class));


    }

    public List<Student> fetchAllStudents()
            throws SQLException {
        String sql
                = "select * from studentdetails where userType='student'";
        return template.query(
                sql, new RowMapper<Student>() {
                    public Student mapRow(ResultSet rs, int row) throws SQLException {
                        Student e = new Student();
                        e.setId(rs.getInt(1));
                        e.setFirstname(rs.getString(2));
                        e.setMiddlename(rs.getString(3));
                        e.setLastname(rs.getString(4));
                        e.setCourse(rs.getString(5));
                        e.setGender(rs.getString(6));
                        e.setCountrycode(rs.getString(7));
                        e.setPhone(rs.getString(8));
                        e.setAddress(rs.getString(9));
                        e.setEmail(rs.getString(10));
                        return e;
                    }
                });

    }


    //login
    public Student login(String userName,String password,String userType) throws  Exception{

        String sql="select * from studentdetails where firstname='"+userName+"' and psw='"+password+"' and userType='"+userType+"'";

        return template.queryForObject(
                sql, new BeanPropertyRowMapper<Student>(
                        Student.class));


    }

}
