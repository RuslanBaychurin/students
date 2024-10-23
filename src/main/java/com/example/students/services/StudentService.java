package com.example.students.services;

import com.example.students.models.SQLStudent;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StudentService {

    public List<SQLStudent> listStudents() {return StudentDAO.getAllStudents();}

    public void addStudent(SQLStudent student) {StudentDAO.addStudent(student);}

    public void deleteStudent(int id) {StudentDAO.deleteStudentById(id);}

    public void updateStudent(SQLStudent student) {StudentDAO.updateStudent(student);}

    public SQLStudent getStudentById(int id) {return StudentDAO.getStudentById(id);}
}

