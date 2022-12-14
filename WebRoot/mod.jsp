<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<%@ include file="head.jsp" %>
<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">修改密码:</div>
            <div class="panel-body">
       <script src="js/jquery.validate.js"></script>

            <form action="login?ac=adminuppass" method="post" name="form1" id="form1" style="width: 420px;margin:0 auto"><!-- form 标签开始 -->

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-xs-12 col-md-3">原密码<span
                                style="color: red;">*</span></label>
                        <div class="col-xs-12 col-md-9">

                            <input type="text" style="width: 200px" class="form-control" autocomplete="off" placeholder="请输入原密码" name="ymm"/>

                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-xs-12 col-md-3">新密码<span
                                style="color: red;">*</span></label>
                        <div class="col-xs-12 col-md-9">

                            <input type="text" style="width: 200px" class="form-control" autocomplete="off" placeholder="请输入新密码" name="xmm1" id="xmm1"/>

                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-xs-12 col-md-3">确认密码<span
                                style="color: red;">*</span></label>
                        <div class="col-xs-12 col-md-9">

                            <input type="text" style="width: 200px" class="form-control" autocomplete="off" placeholder="请输入确认密码" name="xmm2" id="xmm2" equalTo="#xmm1" data-msg-equalTo="两次密码不一致"/>

                        </div>

                    </div>
                </div>
                <div class="form-group" style="text-align: center">


                    <button type="submit" class="btn btn-primary" name="Submit">
                        提交
                    </button>
                    <button type="reset" class="btn btn-default" name="Submit2">
                        重置
                    </button>

                </div>

                <!--form标签结束--></form>
     



            </div>
        </div>

        <!-- container定宽，并剧中结束 --></div>



</div>


<%@ include file="foot.jsp" %>