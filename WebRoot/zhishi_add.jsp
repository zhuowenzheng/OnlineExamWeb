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
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>
<script src="js/jquery.validate.js"></script>


<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加 知识:</div>
            <div class="panel-body">
       <form action="zhishi.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             知识标题<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入知识标题" style="width:400px;"    data-rule-required="true" data-msg-required="请填写知识标题"  id="zhishibiaoti" name="zhishibiaoti" value=""/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             图片<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                            <div class="input-group" style="width:250px">
                                    <input type="text" class="form-control"   data-rule-required="true" data-msg-required="请填写图片" id="tupian" name="tupian" value=""/>
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"
                                                onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],
                                                content:'upload.html?result=tupian'})">上传图片
                                        </button>
                                    </span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             所属章节<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                            <select class="form-control" name="suoshuzhangjie" id="suoshuzhangjie" data-value=""  data-rule-required="true" data-msg-required="请选择所属章节" style="width:250px;" >
<option value>请选择所属章节</option>
<%List<HashMap> select72 = new CommDAO().select("SELECT * FROM zhangjie ORDER BY id desc");%>
<% for (HashMap m : select72) { %><option value="<%= m.get("id") %>" readonly><%= m.get("zhangjiemingchen") %></option>
<% } %>
</select>


                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             知识内容
                            </label>
                            <div class="col-sm-10">

                            <textarea id="zhishineirong" name="zhishineirong" style="max-width: 750px;width:100%; height: 300px;"></textarea>
<script>(function () {var um = UM.getEditor('zhishineirong');})();</script>

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