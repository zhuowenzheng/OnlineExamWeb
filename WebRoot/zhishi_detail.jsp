<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<% HashMap map = Query.make("zhishi").where("id", request.getParameter("id")).find(); %>
<div style="padding: 10px" class="admin-content">
    <div class="admin-detail">
<table class="table table-detail">
<tr>
<td width="180">id</td>
<td><%=map.get("id")%>
</td>
<td width="180">知识标题</td>
<td><%=map.get("zhishibiaoti")%>
</td>
</tr><tr>
<td width="180">图片</td>
<td><% if("".equals(map.get("tupian"))){ %>-<% }else{ %><img width="100px" src="<%=map.get("tupian")%>"/> <% } %></td>
<td width="180">所属章节</td>
<td><%HashMap mapsuoshuzhangjie72 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ map.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie72.get("zhangjiemingchen") %></td>
</tr><tr>
<td width="180">知识内容</td>
<td><%=map.get("zhishineirong")%>
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