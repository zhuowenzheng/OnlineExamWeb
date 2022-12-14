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
    } %><%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>


<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加 学生:</div>
            <div class="panel-body">
       <form action="xuesheng.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学号<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入学号" style="width:200px;"    data-rule-required="true" data-msg-required="请填写学号"  remote="factory/checkno.jsp?checktype=insert&table=xuesheng&col=xuehao" data-msg-remote="内容重复了"  id="xuehao" name="xuehao" value=""/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             密码<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="password" class="form-control" placeholder="输入密码" style="width:150px;"    data-rule-required="true" data-msg-required="请填写密码"  id="mima" name="mima" value=""/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             姓名<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入姓名" style="width:200px;"    data-rule-required="true" data-msg-required="请填写姓名"  id="xingming" name="xingming" value=""/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             性别<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                            <select class="form-control class_xingbie243" name="xingbie" id="xingbie" data-value="男"  data-rule-required="true" data-msg-required="请选择性别" style="width:250px;" >
<option value>请选择性别</option>
<option value="男">男</option>
<option value="女">女</option>
</select>
<script>$(".class_xingbie243").val($(".class_xingbie243").attr("data-value"))</script>


                            </div>

                        </div>
                    </div>

                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             
                            </label>
                            <div class="col-sm-10">

                            <button type="submit" class="btn btn-primary" name="Submit">提交</button>
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