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
 HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "xuexiguochengjilu");%>

<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑 学习过程记录:</div>
            <div class="panel-body">
       <form action="xuexiguochengjilu.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

 <input type="hidden" id="id" name="id" value="<%=mmm.get("id")%>" />
 <input type="hidden" id="lianxitiid" name="lianxitiid" value="<%=mmm.get("lianxitiid")%>" />
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
                             所属章节
                            </label>
                            <div class="col-sm-10">

                            <%HashMap mapsuoshuzhangjie425 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ mmm.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie425.get("zhangjiemingchen") %> <input type="hidden" id="suoshuzhangjie" name="suoshuzhangjie" value="<%= Info.html(mmm.get("suoshuzhangjie")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             练习题目
                            </label>
                            <div class="col-sm-10">

                            <%=mmm.get("lianxitimu")%>
 <input type="hidden" id="lianxitimu" name="lianxitimu" value="<%= Info.html(mmm.get("lianxitimu")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             类型
                            </label>
                            <div class="col-sm-10">

                            <%=mmm.get("leixing")%> <input type="hidden" id="leixing" name="leixing" value="<%= Info.html(mmm.get("leixing")) %>" />

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
                             答案
                            </label>
                            <div class="col-sm-10">

                            <textarea style="width:80%;height:150px;max-width:90%;min-height:120px" class="form-control" palaceholder="输入答案"  id="daan"   name="daan"   ><%=Info.html(mmm.get("daan"))%></textarea>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             得分<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入得分" style="width:150px;"    step="0.01" data-rule-required="true" data-msg-required="请填写得分" number="true" data-msg-number="输入一个有效数字"  id="defen" name="defen" value="<%=Info.html(mmm.get("defen"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             字母(所选字母)
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入字母" style="width:200px;"     id="zimu" name="zimu" value="<%=Info.html(mmm.get("zimu"))%>"/>

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

 <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("referer")%>" />
 <input type="hidden" id="updtself" name="updtself" value="<%= updtself %>" />
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             
                            </label>
                            <div class="col-sm-10">

                            <button type="submit" class="btn btn-primary" name="Submit">确认批改</button>
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