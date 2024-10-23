package com.example.students.services;

import com.example.students.db.DatabaseConnection;
import com.example.students.models.SQLStudent;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public static void addStudent(SQLStudent student) {
        String insertSQL = "INSERT INTO students (first_name, last_name, middle_name, bdate, group_name, curator) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {

            pstmt.setString(1, student.getFirstName());
            pstmt.setString(2, student.getLastName());
            pstmt.setString(3, student.getMiddleName());
            pstmt.setString(4, student.getBirthDate());
            pstmt.setString(5, student.getGroupName());
            pstmt.setString(6, student.getCurator());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Ошибка при добавлении студента: " + e.getMessage());
        }
    }


    public static List<SQLStudent> getAllStudents() {
        List<SQLStudent> students = new ArrayList<>();
        String selectSQL = "SELECT * FROM students";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(selectSQL)) {

            while (rs.next()) {
                SQLStudent student = new SQLStudent();
                student.setId(rs.getInt("id"));
                student.setFirstName(rs.getString("first_name"));
                student.setLastName(rs.getString("last_name"));
                student.setMiddleName(rs.getString("middle_name"));
                student.setBirthDate(rs.getString("bdate"));
                student.setGroupName(rs.getString("group_name"));
                student.setCurator(rs.getString("curator"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Ошибка при получении списка студентов: " + e.getMessage());
        }

        return students;
    }


    public static void deleteStudentById(int id) {
        String deleteSQL = "DELETE FROM students WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(deleteSQL)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Ошибка при удалении студента: " + e.getMessage());
        }
    }

    public static SQLStudent getStudentById(int id) {
        String selectSQL = "SELECT * FROM students WHERE id = ?";
        SQLStudent student = null;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(selectSQL)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                student = new SQLStudent();
                student.setId(rs.getInt("id"));
                student.setFirstName(rs.getString("first_name"));
                student.setLastName(rs.getString("last_name"));
                student.setMiddleName(rs.getString("middle_name"));
                student.setBirthDate(rs.getString("bdate"));
                student.setGroupName(rs.getString("group_name"));
                student.setCurator(rs.getString("curator"));
            }
        } catch (SQLException e) {
            System.out.println("Ошибка при получении студента: " + e.getMessage());
        }

        return student;
    }

    public static void updateStudent(SQLStudent student) {
        String updateSQL = "UPDATE students SET first_name = ?, last_name = ?, middle_name = ?, bdate = ?, group_name = ?, curator = ? WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(updateSQL)) {

            pstmt.setString(1, student.getFirstName());
            pstmt.setString(2, student.getLastName());
            pstmt.setString(3, student.getMiddleName());
            pstmt.setString(4, student.getBirthDate());
            pstmt.setString(5, student.getGroupName());
            pstmt.setString(6, student.getCurator());
            pstmt.setInt(7, student.getId());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Ошибка при обновлении студента: " + e.getMessage());
        }
    }

}
