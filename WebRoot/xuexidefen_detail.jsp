<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<% HashMap map = Query.make("xuexidefen").where("id", request.getParameter("id")).find(); %>
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
<td width="180">答题编号</td>
<td><%=map.get("datibianhao")%>
</td>
</tr><tr>
<td width="180">单选题得分</td>
<td><%=map.get("danxuantidefen")%>
</td>
<td width="180">多选题得分</td>
<td><%=map.get("duoxuantidefen")%>
</td>
</tr><tr>
<td width="180">填空题得分</td>
<td><%=map.get("tiankongtidefen")%>
</td>
<td width="180">总得分</td>
<td><%=map.get("zongdefen")%>
</td>
</tr><tr>
<td width="180">答题人</td>
<td><%=map.get("datiren")%>
</td>
<td width="180">学习时间</td>
<td><%=map.get("xuexishijian")%>
</td>
</tr><tr>
<td width="180">完成状况</td>
<td><%=map.get("wanchengzhuangkuang")%>
</td>
<td width="180"></td>
<td></td>
</tr></table>
    </div>


    <div class="news-neirong"style="text-align: center">
        <h1>学习路径推荐</h1>
    </div>
    <%--通过统计错题得出需要推荐的章节--%>

    <%--
            推荐您继续学习一下章节的习题
            章节1...当前错了多少提
            ...
            ..--%>


    <%
        List<Map> list = Query.make("xuexiguochengcuoti").field("suoshuzhangjie,count(*) sl").where("datiren", request.getSession().getAttribute("username")).group("suoshuzhangjie").order("sl desc").select();


    %>
    <table class="table table-detail">

        <tr>
            <td>路径序号</td>
            <td>章节</td>
            <td>推荐指数</td>
        </tr>

        <%
            int i=0;
            for (Map mmm : list) {
                i++;
                Map ggg=Query.make("zhangjie").where("id",mmm.get("suoshuzhangjie")).find();
        %>
        <tr>
            <td width="180">
                <%=i%>
            </td>
            <td width="180">
                <%=ggg.get("zhangjiemingchen")%>
            </td>
            <td>
                <%=mmm.get("sl")%>
            </td>

        </tr>
        <%}%>
    </table>





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