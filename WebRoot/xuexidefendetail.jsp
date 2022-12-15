<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
<script>
    alert('对不起,请您先登陆!');
    location.href = 'index.jsp';
</script>
<%
        return;
    } %>
<%
    HashMap map = Query.make("xuexidefen").where("id", request.getParameter("id")).find();
%>

<div>
    <div class="container " style="background: #fff">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row ">
            <div class="col-xs-12 col-md-12">
                <div class="news-detail " style="background: #fff">
                    <div class="news-biaoti">
                        <%=map.get("xueximingchen")%>
                    </div>
                    <div class="news-qitaziduan">

</span><span>单选题得分：<%=map.get("danxuantidefen")%><br>
</span><span>多选题得分：<%=map.get("duoxuantidefen")%><br>
                        </span><span>填空题得分：<%=map.get("tiankongtidefen")%><br>
</span><span>总得分：<%=map.get("zongdefen")%><br>

</span><span>答题人：<%=map.get("datiren")%><br>
</span>
                    </div>
                    <div class="news-neirong"style="text-align: center">
                        <%=map.get("wanchengzhuangkuang")%><br>

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
                            int i = 0;
                            for (Map mmm : list) {
                                i++;
                                Map ggg = Query.make("zhangjie").where("id", mmm.get("suoshuzhangjie")).find();
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


                </div>
            </div>
        </div>  <!-- container定宽，并剧中结束 -->
    </div>
    <%@ include file="footer.jsp" %>
    <%@ include file="foot.jsp" %>
