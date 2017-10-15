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
   String book = new String((request.getParameter("book")).getBytes("ISO-8859-1"),"UTF-8");
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
			     sqls = "DELETE FROM Book WHERE Title = \'"+book+"\'";
				 out.print(sqls);
                 ssff.executeUpdate(sqls);
				 ssff.close();
				 ppee.close();
            
        }
		catch(SQLException se){
            // 处理 JDBC 错误
			out.print("Author not found");
            return;
        }
		catch(Exception e){
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
%>
<h3><b>该条信息已经被删除</h3>
<a href="index.htm">戳这里返回首页</a>