<%@page import="test.jsp.pb.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String foodNum = request.getParameter("foodNum");
String foodName = request.getParameter("foodName");
String foodPrice = request.getParameter("foodPrice");
String sql = "update food set food_name=?, food_price=? ";
sql += " where food_num=?";

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,foodName);
ps.setString(2,foodPrice);
ps.setString(3,foodNum);
int cnt = ps.executeUpdate();
String result = "수정 실패";
if(cnt>0) {
	result = "수정 성공";
}
%>

<script>
alert("<%=result%>");
location.href="/jsp-home/food/view.jsp?foodNum="+<%=foodNum%>;
</script>