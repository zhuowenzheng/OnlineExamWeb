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
 HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "xuexidefen");%>

<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑 学习得分:</div>
            <div class="panel-body">
       <form action="xuexidefen.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

 <input type="hidden" id="id" name="id" value="<%=mmm.get("id")%>" />
 <input type="hidden" id="xuexiid" name="xuexiid" value="<%=mmm.get("xuexiid")%>" />
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习编号
                            </label>
                            <div class="col-sm-10">

                            <%=mmm.get("xuexibianhao")%>
 <input type="hidden" id="xuexibianhao" name="xuexibianhao" value="<%= Info.html(mmm.get("xuexibianhao")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习名称
                            </label>
                            <div class="col-sm-10">

                            <%=mmm.get("xueximingchen")%>
 <input type="hidden" id="xueximingchen" name="xueximingchen" value="<%= Info.html(mmm.get("xueximingchen")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             答题编号
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入答题编号" style="width:200px;"    data-rule-required="true" data-msg-required="请填写答题编号" readonly="readonly"  id="datibianhao" name="datibianhao" value="<%=Info.html(mmm.get("datibianhao"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             单选题得分
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入单选题得分" style="width:150px;"    step="0.01" number="true" data-msg-number="输入一个有效数字"  id="danxuantidefen" name="danxuantidefen" value="<%=Info.html(mmm.get("danxuantidefen"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             多选题得分
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入多选题得分" style="width:150px;"    step="0.01" number="true" data-msg-number="输入一个有效数字"  id="duoxuantidefen" name="duoxuantidefen" value="<%=Info.html(mmm.get("duoxuantidefen"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             填空题得分
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入填空题得分" style="width:150px;"    step="0.01" number="true" data-msg-number="输入一个有效数字"  id="tiankongtidefen" name="tiankongtidefen" value="<%=Info.html(mmm.get("tiankongtidefen"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             总得分
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入总得分" style="width:150px;"    step="0.01" number="true" data-msg-number="输入一个有效数字"  id="zongdefen" name="zongdefen" value="<%=Info.html(mmm.get("zongdefen"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             答题人
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入答题人" style="width:150px;"    readonly="readonly"  id="datiren" name="datiren" value="<%=Info.html(mmm.get("datiren"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习时间
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入学习时间" style="width:200px;"     id="xuexishijian" name="xuexishijian" value="<%=Info.html(mmm.get("xuexishijian"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             完成状况
                            </label>
                            <div class="col-sm-10">

                            <textarea style="width:80%;height:150px;max-width:90%;min-height:120px" class="form-control" palaceholder="输入完成状况"  id="wanchengzhuangkuang"   name="wanchengzhuangkuang"   ><%=Info.html(mmm.get("wanchengzhuangkuang"))%></textarea>

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