<!DOCTYPE html>


<html>

<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="com.jdbc.DBUtility" %>
<%@ page import="java.sql.DriverManager"%>
<%@page import="com.jdbc.DBUtilityAuto" %>
<%@ page import="java.sql.*"%>

<head>
    <meta charset="UTF-8">
    <title> IIB Volume Analysis </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel='stylesheet' href='https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css'>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

    <link href=
    "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
                  rel="stylesheet">


                  <!-- Bootstrap 5 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
<!-- Data Table CSS -->
<link rel='stylesheet' href='https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap5.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'>

<script
    src="https://code.jquery.com/jquery-3.7.0.js">
</script>
<script
    src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js">
</script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
     <style>


     * {
  box-sizing: border-box;
}

.row {
  margin-left:-5px;
  margin-right:-5px;
}

.column {
  float: left;
  width: 50%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other on screens that are smaller than 600 px */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}

    .footer {
   position: relative;
   left: 0;
   bottom: 0;
   width: 100%;
   color: black;
   text-align: center;
}

h1 {
text-align: center;
}
    </style>
<script type="text/javascript">

</script>
</head>

<body >

<form>
 <h1>IIB Volume Analysis</h1>
    <div class="row">
    <div class="column" style="width: 33%;">
    <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>EXP SERVICE</th>
                <th>Total Count</th>

            </tr>
        </thead>
        <tbody>
           <%
           Connection conn=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query = "select api_name, count(1) AS Totalcnt from EISAPP.api_log where  TRUNC(request_date_time)=TRUNC(SYSDATE-1) group by api_name";

                                                        System.out.println(query);
                                                        Statement stmt = conn.createStatement();
                                                        ResultSet rs = stmt.executeQuery(query);
                                                        System.out.println(rs);

                                                        while (rs.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs.getString("api_name"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn != null){
                        conn.close();
                }
        }
 %>
    </table>


</div>


   <div class="column" style="width: 33%;">
    <table id="example1" class="display" style="width:100%">
        <thead>
            <tr>
               <th>EXP_IP</th>
               <th>Total Count</th>

            </tr>
        </thead>
        <tbody>
           <%
           Connection conn1=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query1 = "select exp_ip, count(1) AS Totalcnt from EISAPP.api_log where  TRUNC(request_date_time)=TRUNC(SYSDATE-1) group by exp_ip";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query1);
                                                        Statement stmt = conn1.createStatement();
                                                        ResultSet rs1 = stmt.executeQuery(query1);
                                                        System.out.println(rs1);

                                                        while (rs1.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs1.getString("exp_ip"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs1.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs1.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn1 != null){
                        conn1.close();
                }
        }
 %>

    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example2" class="display" style="width:100%">
        <thead>
            <tr>
                <th>EXP_PORT</th>
                <th>COUNT</th>

            </tr>
        </thead>
        <tbody>
           <%
           Connection conn2=DBUtilityAuto.getIIBDBConnection();

                                                try {



                                                        String query2 = "select EXP_PORT,count(*) AS Totalcnt from EISAPP.api_log where  TRUNC(request_date_time)=TRUNC(SYSDATE-1) group by EXP_PORT";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query2);
                                                        Statement stmt = conn2.createStatement();
                                                        ResultSet rs2 = stmt.executeQuery(query2);
                                                        System.out.println(rs2);

                                                        while (rs2.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs2.getString("EXP_PORT"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs2.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs2.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn2 != null){
                        conn2.close();
                }
        }
 %>
    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example3" class="display" style="width:100%">
     <thead>
            <tr>
                <th>SYS SERVICES</th>
                <th>COUNT</th>

            </tr>
        </thead>
          <tbody>
           <%
           Connection conn3=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query3 = "select api_name, count(1) AS Totalcnt from EISAPP.backend_log where  TRUNC(request_date_time)=TRUNC(SYSDATE-1) group by api_name";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query3);
                                                        Statement stmt = conn3.createStatement();
                                                        ResultSet rs3 = stmt.executeQuery(query3);
                                                        System.out.println(rs3);

                                                        while (rs3.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs3.getString("api_name"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs3.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs3.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn3 != null){
                        conn3.close();
                }
        }
 %>

    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example4" class="display" style="width:100%">
        <thead>
            <tr>
                <th>SYS_IP</th>
                <th>COUNT</th>

            </tr>
        </thead>
       <tbody>
           <%
           Connection conn4=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query4 = "select sys_ip, count(1) AS Totalcnt from EISAPP.backend_log where  TRUNC(request_date_time)=TRUNC(SYSDATE-1) group by sys_ip";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query4);
                                                        Statement stmt = conn4.createStatement();
                                                        ResultSet rs4 = stmt.executeQuery(query4);
                                                        System.out.println(rs4);

                                                        while (rs4.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs4.getString("sys_ip"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs4.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs4.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn4 != null){
                        conn4.close();
                }
        }
 %>

    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example5" class="display" style="width:100%">
        <thead>
            <tr>
                <th>SYS_PORT</th>
                <th>COUNT</th>

            </tr>
        </thead>
        <tbody>
           <%
           Connection conn5=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query5 = "select SYS_PORT,count(*) AS Totalcnt from EISAPP.backend_log where  TRUNC(request_date_time)=TRUNC(SYSDATE-1) group by SYS_PORT";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query5);
                                                        Statement stmt = conn5.createStatement();
                                                        ResultSet rs5 = stmt.executeQuery(query5);
                                                        System.out.println(rs5);

                                                        while (rs5.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs5.getString("SYS_PORT"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs5.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs5.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn5 != null){
                        conn5.close();
                }
        }
 %>

    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example6" class="display" style="width:100%">
        <thead>
            <tr>
                <th>NON GEN-5 SERVICE_NAME</th>
                <th>COUNT</th>

            </tr>
        </thead>
          <tbody>
           <%
           Connection conn6=DBUtilityAuto.getIIBDBConnection();

                                                try {

                                                        String query6 = "select SERVICE_NAME ,count(*) AS Totalcnt from EISAPP.api_processing_log where trunc(request_time)=trunc(sysdate-1) group by SERVICE_NAME order by 2 desc";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query6);
                                                        Statement stmt = conn6.createStatement();
                                                        ResultSet rs6 = stmt.executeQuery(query6);
                                                        System.out.println(rs6);

                                                        while (rs6.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs6.getString("SERVICE_NAME"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs6.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs6.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn6 != null){
                        conn6.close();
                }
        }
 %>

    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example7" class="display" style="width:100%">
        <thead>
            <tr>
                <th>NON GEN-5 SERVER IP</th>
                <th>COUNT</th>

            </tr>
        </thead>
        <tbody>
           <%
           Connection conn7=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query7 = "select substr(source_ip,instr(source_ip,'-') +2,instr(substr(source_ip,instr(source_ip,'-') +1),':') -3) as IP ,count(*) AS Totalcnt from EISAPP.api_processing_log where trunc(request_time)=trunc(sysdate-1) group by substr(source_ip, instr(source_ip,'-') +2, instr(substr(source_ip, instr(source_ip,'-') +1),':') -3)";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query7);
                                                        Statement stmt = conn7.createStatement();
                                                        ResultSet rs7 = stmt.executeQuery(query7);
                                                        System.out.println(rs7);

                                                        while (rs7.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs7.getString("IP"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs7.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs7.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn7 != null){
                        conn7.close();
                }
        }
 %>
    </table>
</div>

<div class="column" style="width: 33%;">
    <table id="example8" class="display" style="width:100%">
        <thead>
            <tr>
                <th>NON GEN5 PORT WISE</th>
                <th>COUNT</th>

            </tr>
        </thead>
         <tbody>
           <%
           Connection conn8=DBUtilityAuto.getIIBDBConnection();

                                                try {


                                                        String query8 = "select trim(substr(source_ip ,instr( source_ip,':')+1,10)) AS NONGEN,count(*) AS Totalcnt from EISAPP.api_processing_log where  source_ip like '%10.191.171%'  and trunc(request_time)=trunc(sysdate-1) group by  trim(substr(source_ip ,instr( source_ip,':')+1,    10))";
                                                        //Connection conn = DriverManager.getConnection(url, username, password);
                                                        System.out.println(query8);
                                                        Statement stmt = conn8.createStatement();
                                                        ResultSet rs8 = stmt.executeQuery(query8);
                                                        System.out.println(rs8);

                                                        while (rs8.next()) {
                                        %>

           <tr>

                                                <td>
                                                        <%
                                                                out.println(rs8.getString("NONGEN"));
                                                        %>

                                                </td>


                                                        <td>
                                                        <%
                                                                out.println(rs8.getString("Totalcnt"));
                                                        %>

                                                </td>




                                        <%
                                                }
                                        %>
                 </tr>
        </tbody>
        <%
     rs8.close();

        } catch (Exception e) {

                e.printStackTrace();

        }
        finally{
                if(conn8 != null){
                        conn8.close();
                }
        }
 %>
    </table>
</div>



</div>


<input type="button" value="Export Data" onclick="exportToExcel()" class="btn btn-primary" style="position: relative; left: 47%;">


</form>
<!--  <div class="footer">
    <p class="font-italic text-center text-bottom" style=" font-size: 15px">Designed & Developed by @ Vaishnavi Mundhekar</p>
    </div> -->


    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js">
</script>
    <script>

function exportToExcel() {
        let workbook =
        XLSX.utils.book_new();

        let table1 =
        document.getElementById('example');

        let worksheet1 =
        XLSX.utils.table_to_sheet(example);
        XLSX.utils.book_append_sheet(workbook, worksheet1, 'GEN5_EXP_SERVICE_WISE');

        let example1 =
        document.getElementById('example1');
        let worksheet2 =
        XLSX.utils.table_to_sheet(example1);
        XLSX.utils.book_append_sheet(workbook, worksheet2, 'GEN5_EXP_SERVER_WISE');

        let example2 =
        document.getElementById('example2');
        let worksheet3 =
        XLSX.utils.table_to_sheet(example2);
        XLSX.utils.book_append_sheet(workbook, worksheet3, 'GEN5_EXP_PORT_WISE');

        let example3 =
        document.getElementById('example3');
        let worksheet4 =
        XLSX.utils.table_to_sheet(example3);
        XLSX.utils.book_append_sheet(workbook, worksheet4, 'GEN5_SYS_SERVICE_WISE');

        let example4 =
        document.getElementById('example4');
        let worksheet5 =
        XLSX.utils.table_to_sheet(example4);
        XLSX.utils.book_append_sheet(workbook, worksheet5, 'GEN5_SYS_SERVER_WISE');

        let example5 =
        document.getElementById('example5');
        let worksheet6 =
        XLSX.utils.table_to_sheet(example5);
        XLSX.utils.book_append_sheet(workbook, worksheet6, 'GEN5_SYS_PORT_WISE');

        let example6 =
        document.getElementById('example6');
        let worksheet7 =
        XLSX.utils.table_to_sheet(example6);
        XLSX.utils.book_append_sheet(workbook, worksheet7, 'NON_GEN5_SERVICE_WISE');

        let example7 =
        document.getElementById('example7');
        let worksheet8 =
        XLSX.utils.table_to_sheet(example7);
        XLSX.utils.book_append_sheet(workbook, worksheet8, 'NON_GEN5_SERVER_WISE');

        let example8 =
        document.getElementById('example8');
        let worksheet9 =
        XLSX.utils.table_to_sheet(example8);
        XLSX.utils.book_append_sheet(workbook, worksheet9, 'NON_GEN5_PORT_WISE');



        XLSX.writeFile(workbook, 'volume analysis sheet.xlsx');


    }






        new DataTable('#example', {
    pagingType: 'full_numbers'
});

 new DataTable('#example1', {
    pagingType: 'full_numbers'
});
new DataTable('#example2', {
    pagingType: 'full_numbers'
});
new DataTable('#example3', {
    pagingType: 'full_numbers'
});
new DataTable('#example4', {
    pagingType: 'full_numbers'
});
new DataTable('#example5', {
    pagingType: 'full_numbers'
});
new DataTable('#example6', {
    pagingType: 'full_numbers'
});
new DataTable('#example7', {
    pagingType: 'full_numbers'
});
new DataTable('#example8', {
    pagingType: 'full_numbers'
});
    </script>
</body>


</html>
