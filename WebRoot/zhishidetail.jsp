<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='index.jsp';
    </script>
    <%
        return;
    } %>
<%
HashMap map = Query.make("zhishi").where("id", request.getParameter("id")).find();
%>

<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                                 
                <div class="trust_detail  "   style="background: #fff" >
                    <div class="event-left-sidebar">
                        <img src="<%=Info.images(map.get("tupian"))%>" alt="">
                        <div class="event-text">
                            <h3><%=map.get("zhishibiaoti")%></h3>
                            <span>所属章节：<%HashMap mapsuoshuzhangjie72 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ map.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie72.get("zhangjiemingchen") %></span><span>添加时间：<%=Info.subStr(map.get("tianjiashijian"),19,"")%>
</span>
                            <p><%=map.get("zhishineirong")%></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>  <!-- container定宽，并剧中结束 -->
</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
