<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<% HashMap map = Query.make("xuexi").where("id", request.getParameter("id")).find(); %>
<div style="padding: 10px" class="admin-content">
    <div class="admin-detail">
<table class="table table-detail">
<tr>
<td width="180">id</td>
<td><%=map.get("id")%>
</td>
<td width="180">学习编号</td>
<td><%=map.get("xuexibianhao")%>
</td>
</tr><tr>
<td width="180">学习名称</td>
<td><%=map.get("xueximingchen")%>
</td>
<td width="180">学习时长</td>
<td><%=map.get("xuexishichang")%>
</td>
</tr><tr>
<td width="180">学习介绍</td>
<td><%=map.get("xuexijieshao")%>
</td>
<td width="180">添加时间</td>
<td><%=Info.subStr(map.get("tianjiashijian"),19,"")%>
</td>
</tr></table>

    </div>
    <div class="button-list">
        <div class="">
            <button onclick="history.go(-1);"
                    style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
            </button>
            <button onclick="window.print()"
                    style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
            </button>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>