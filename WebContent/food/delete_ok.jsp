<%@page import="test.jsp.pb.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String foodNum = request.getParameter("foodNum");

String sql = "delete from food where food_num=?";

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,foodNum);
int cnt = ps.executeUpdate();
String result = "실패";
if(cnt==1) {
	result = "성공";
}
%>

<script>
alert("<%=result%>");
location.href="/jsp-home/food/list.jsp";
</script>