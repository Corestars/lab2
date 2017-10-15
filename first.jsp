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

   
	  
	  String author = new String((request.getParameter("author")).getBytes("ISO-8859-1"),"UTF-8");
	  String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL = "jdbc:mysql://localhost:3306/lML2jKz7";
      String USER = "lML2jKz7";
      String PASS = "b9ZaEFrg3rTO";
      String title=null;
	  String publisher=null;
	  String publishdate=null;
	  String isbn = null;
	  double price =0;
	  int n=0;
	  out.print("该作者图书信息：");
        Connection conn = null;
		Connection ppee = null;
        Statement stmt = null;
		Statement ssff = null;
        try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");
        
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            String sql;
			sql = "SELECT * FROM Author WHERE name=\'"+author+"\'";
            ResultSet rs = stmt.executeQuery(sql);
 
            // 展开结果集数据库
            while(rs.next()){
                     
                 String id  = rs.getString("AuthorID");
                 ppee = DriverManager.getConnection(DB_URL,USER,PASS);
                 ssff = ppee.createStatement();
                 String sqls;
			     sqls = "SELECT * FROM Book WHERE AuthorID=\'"+id+"\'";
                 ResultSet rss = ssff.executeQuery(sqls);
				 while(rss.next()){ 
				     n++;
					 price = rss.getDouble("price");
                     title = rss.getString("Title");
                     publisher = rss.getString("Publisher");
					 publishdate = rss.getString("Publishdate");
                     isbn = rss.getString("ISBN");
                     
			    out.print("<a href=\"second.jsp?title="+title+"\">书名</a>: " + title);
                // 输出数据
				 }
				 rss.close();
				 ssff.close();
				 ppee.close();
            }
            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();
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
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
		}
		if(n==0)
		{
			out.print("未在库中发现该作者"+"<br>");
		}
        
%>

<h3><b>作者名字为: </b> <%out.print(author);%> </h3>
<h3><b>点击书名以查询相关信息 </h3>
</body>
</html>