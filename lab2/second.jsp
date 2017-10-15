<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>读取到的信息</title>
</head>
<body background="pika.jpeg">
<%
   	  
	  String book = new String((request.getParameter("title")).getBytes("ISO-8859-1"),"UTF-8");
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL = "jdbc:mysql://localhost:3306/lML2jKz7";
      String USER = "lML2jKz7";
	  String PASS = "b9ZaEFrg3rTO";
	  Connection ppee = null;
	  Statement ssff = null;
	   try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");
                 ppee = DriverManager.getConnection(DB_URL,USER,PASS);
                 ssff = ppee.createStatement();
                 String sqls;
			     sqls = "SELECT * FROM Book WHERE Title=\'"+book+"\'";
                 ResultSet rss = ssff.executeQuery(sqls);
				 while(rss.next()){ 
					 double price = rss.getDouble("price");
                     String publisher = rss.getString("Publisher");
					 String publishdate = rss.getString("Publishdate");
                     String isbn = rss.getString("ISBN");
                     
					 out.print("ISBN: " + isbn +"<br>");
					 out.print("出版社: " + publisher+"<br>");
					 out.print("出版日期: " + publishdate+"<br>");
					 out.print("价格: " + price+"<br>");
                // 输出数据
				 }
				 rss.close();
				 ssff.close();
				 ppee.close();
            
        }catch(SQLException se){
            // 处理 JDBC 错误
			out.print("Author not found");
            return;
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(ssff!=null) ssff.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(ppee!=null) ppee.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
		}
        out.print("<a href=\"third.jsp?book="+book+"\">点击此处以删除该条数据</a>: " );
%>