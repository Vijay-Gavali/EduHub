package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
public class AdminUploadStudentExcelController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Part filePart = request.getPart("file");
        InputStream fileContent = filePart.getInputStream();

        try (Workbook workbook = new XSSFWorkbook(fileContent)) {
            Sheet sheet = workbook.getSheetAt(0);
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO users (admission_no, admission_date, name, father_name, mother_name, dob, aadhar_no, parent_aadhar, phone, address, email, password, contact_no, role, age, grade, class_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            Iterator<Row> rowIterator = sheet.iterator();
            rowIterator.next(); // Skip header row

            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();

                ps.setString(1, getCellValue(row.getCell(1))); // admission_no
                ps.setString(2, getCellValue(row.getCell(2))); // admission_date
                ps.setString(3, getCellValue(row.getCell(3))); // name
                ps.setString(4, getCellValue(row.getCell(4))); // father_name
                ps.setString(5, getCellValue(row.getCell(5))); // mother_name
                ps.setString(6, getCellValue(row.getCell(6))); // dob
                ps.setString(7, getCellValue(row.getCell(7))); // aadhar_no
                ps.setString(8, getCellValue(row.getCell(8))); // parent_aadhar
                ps.setString(9, getCellValue(row.getCell(9))); // phone
                ps.setString(10, getCellValue(row.getCell(10))); // address
                ps.setString(11, getCellValue(row.getCell(11))); // email
                ps.setString(12, getCellValue(row.getCell(12))); // password
                ps.setString(13, getCellValue(row.getCell(13))); // contact_no
                ps.setString(14, "Student"); // default role
                ps.setInt(15, Integer.parseInt(getCellValue(row.getCell(15)))); // age
                ps.setString(16, getCellValue(row.getCell(16))); // grade
                ps.setInt(17, Integer.parseInt(getCellValue(row.getCell(17)))); // class_id

                ps.addBatch();
            }

            ps.executeBatch();
            con.close();

            out.println("<h3>✅ Excel data imported successfully!</h3>");
        } catch (Exception e) {
            e.printStackTrace(out);
            System.out.println(e);

        }
    }

    private String getCellValue(Cell cell) {
        if (cell == null)
            return "";
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    java.util.Date date = cell.getDateCellValue();
                    return new java.text.SimpleDateFormat("yyyy-MM-dd").format(date);
                } else {
                    return String.valueOf((long) cell.getNumericCellValue());
                }
            default:
                return "";
        }
    }
}
