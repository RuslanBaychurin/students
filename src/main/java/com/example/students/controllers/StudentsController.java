package com.example.students.controllers;

import com.example.students.models.SQLStudent;
import com.example.students.services.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class StudentsController {
    private final StudentService studentService;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/students")
    public String studentsPage(Model model) {
        model.addAttribute("students", studentService.listStudents());
        return "students";
    }

    @PostMapping("/students/create")
    public String createStudent(SQLStudent student) {
        studentService.addStudent(student);
        return "redirect:/students";
    }

    @PostMapping("/students/delete/user/id/{id}")
    public String deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(Math.toIntExact(id));
        return "redirect:/students";

    }

    @PostMapping("/students/delete/user/by/id")
    public String deleteStudentById(@RequestParam("id") Long id) {
        studentService.deleteStudent(Math.toIntExact(id));
        return "redirect:/students";
    }

    @PostMapping("/students/update")
    public String saveStudent(@ModelAttribute SQLStudent student) {
        studentService.updateStudent(student);
        return "redirect:/students";

    }

    @GetMapping("/students/edit/user/id/{id}")
    public String studentEdit(@PathVariable Long id, Model model) {
        model.addAttribute("student", studentService.getStudentById(Math.toIntExact(id)));

        return "student-edit";
    }
}
