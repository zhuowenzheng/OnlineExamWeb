<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>
<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

 <%// 获取需要编辑的数据
 String updtself = "0"; // 设置更新
 HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "zhangjie");%>

<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑 章节:</div>
            <div class="panel-body">
       <form action="zhangjie.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

 <input type="hidden" id="id" name="id" value="<%=mmm.get("id")%>" />
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             章节名称<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入章节名称" style="width:200px;"    data-rule-required="true" data-msg-required="请填写章节名称"  remote="factory/checkno.jsp?checktype=update&id=<%=mmm.get("id")%>&table=zhangjie&col=zhangjiemingchen" data-msg-remote="内容重复了"  id="zhangjiemingchen" name="zhangjiemingchen" value="<%=Info.html(mmm.get("zhangjiemingchen"))%>"/>

                            </div>

                        </div>
                    </div>

 <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("referer")%>" />
 <input type="hidden" id="updtself" name="updtself" value="<%= updtself %>" />
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             
                            </label>
                            <div class="col-sm-10">

                            <button type="submit" class="btn btn-primary" name="Submit">确认修改</button>
<button type="reset" class="btn btn-default" name="Submit2">重置</button>


                            </div>

                        </div>
                    </div>
</form>
<script>$(function () {$('#form1').validate();});</script>


            </div>
        </div>

        <!-- container定宽，并剧中结束 --></div>



</div>


<%@ include file="foot.jsp" %>