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
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>
<script src="js/jquery.validate.js"></script>

 <%// 获取需要编辑的数据
 String updtself = "0"; // 设置更新
 HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "xuexi");%>

<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑 学习:</div>
            <div class="panel-body">
       <form action="xuexi.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

 <input type="hidden" id="id" name="id" value="<%=mmm.get("id")%>" />
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习编号
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入学习编号" style="width:200px;"    data-rule-required="true" data-msg-required="请填写学习编号" readonly="readonly"  id="xuexibianhao" name="xuexibianhao" value="<%=Info.html(mmm.get("xuexibianhao"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习名称<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入学习名称" style="width:400px;"    data-rule-required="true" data-msg-required="请填写学习名称"  id="xueximingchen" name="xueximingchen" value="<%=Info.html(mmm.get("xueximingchen"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习时长<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入学习时长" style="width:150px;"    data-rule-required="true" data-msg-required="请填写学习时长" number="true" data-msg-number="输入一个有效数字"  id="xuexishichang" name="xuexishichang" value="<%=Info.html(mmm.get("xuexishichang"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习介绍
                            </label>
                            <div class="col-sm-10">

                            <textarea id="xuexijieshao" name="xuexijieshao" style="max-width: 750px;width:100%; height: 300px;"><%=Info.html(mmm.get("xuexijieshao"))%></textarea>
<script>(function () {var um = UM.getEditor('xuexijieshao');})();</script>

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