package com.model;

public class Teacher {

    // Class info
    private int classId;
    private String className;
    private int totalStudents;

    // Student info
    private int studentId;
    private String studentName;
    private String admissionNo;
    private String grade;

    // Attendance info
    private String attendanceDate;
    private String status;
    private boolean attendanceMarkedToday;

    public boolean isAttendanceMarkedToday() {
        return attendanceMarkedToday;
    }

    public void setAttendanceMarkedToday(boolean attendanceMarkedToday) {
        this.attendanceMarkedToday = attendanceMarkedToday;
    }


    // ✅ Default constructor (needed for setters)
    public Teacher() {}

    // Constructor for Class info
    public Teacher(int classId, String className, int totalStudents) {
        this.classId = classId;
        this.className = className;
        this.totalStudents = totalStudents;
    }

    // Constructor for Student info
    public Teacher(int studentId, String studentName, String admissionNo, String grade, String className) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.admissionNo = admissionNo;
        this.grade = grade;
        this.className = className;
    }

    // Constructor for Attendance info
    public Teacher(String studentName, String attendanceDate, String status) {
        this.studentName = studentName;
        this.attendanceDate = attendanceDate;
        this.status = status;
    }
   

    // Optional: ToString
    @Override
    public String toString() {
        return "Teacher [studentId=" + studentId + ", studentName=" + studentName + 
               ", className=" + className + ", attendanceMarkedToday=" + attendanceMarkedToday + "]";
    }

    // Getters & Setters for Class info
    public int getClassId() { return classId; }
    public void setClassId(int classId) { this.classId = classId; }

    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }

    public int getTotalStudents() { return totalStudents; }
    public void setTotalStudents(int totalStudents) { this.totalStudents = totalStudents; }

    // Getters & Setters for Student info
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getAdmissionNo() { return admissionNo; }
    public void setAdmissionNo(String admissionNo) { this.admissionNo = admissionNo; }

    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }

    // Getters & Setters for Attendance info
    public String getAttendanceDate() { return attendanceDate; }
    public void setAttendanceDate(String attendanceDate) { this.attendanceDate = attendanceDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
