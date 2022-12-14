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


    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>       
    
    <% Map readMap = Query.make("lianxiti").where("id", request.getParameter("id")).find(); %>

<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加 学习过程错题:</div>
            <div class="panel-body">
       <form action="xuexiguochengcuoti.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

 <input type="hidden" id="lianxitiid" name="lianxitiid" value="<%=request.getParameter("id") !=null ? request.getParameter("id") :""%>" />
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习编号
                            </label>
                            <div class="col-sm-10">

                            <%=readMap.get("xuexibianhao")%>
 <input type="hidden" id="xuexibianhao" name="xuexibianhao" value="<%= Info.html(readMap.get("xuexibianhao")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             学习名称
                            </label>
                            <div class="col-sm-10">

                            <%=readMap.get("xueximingchen")%>
 <input type="hidden" id="xueximingchen" name="xueximingchen" value="<%= Info.html(readMap.get("xueximingchen")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             练习题目
                            </label>
                            <div class="col-sm-10">

                            <%=readMap.get("lianxitimu")%>
 <input type="hidden" id="lianxitimu" name="lianxitimu" value="<%= Info.html(readMap.get("lianxitimu")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             所属章节
                            </label>
                            <div class="col-sm-10">

                            <%HashMap mapsuoshuzhangjie424 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ readMap.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie424.get("zhangjiemingchen") %> <input type="hidden" id="suoshuzhangjie" name="suoshuzhangjie" value="<%= Info.html(readMap.get("suoshuzhangjie")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             类型
                            </label>
                            <div class="col-sm-10">

                            <%=readMap.get("leixing")%> <input type="hidden" id="leixing" name="leixing" value="<%= Info.html(readMap.get("leixing")) %>" />

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             答题编号
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入答题编号" style="width:200px;"    readonly="readonly"  id="datibianhao" name="datibianhao" value="<%= Info.getID() %>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             答案
                            </label>
                            <div class="col-sm-10">

                            <textarea style="width:80%;height:150px;max-width:90%;min-height:120px" class="form-control" palaceholder="输入答案"  id="daan"   name="daan"   ></textarea>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             字母
                            </label>
                            <div class="col-sm-10">

                            <textarea style="width:80%;height:150px;max-width:90%;min-height:120px" class="form-control" palaceholder="输入字母"  id="zimu"   name="zimu"   ></textarea>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             正确答案<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                            <textarea style="width:80%;height:150px;max-width:90%;min-height:120px" class="form-control" palaceholder="输入正确答案"  id="zhengquedaan"   name="zhengquedaan"   data-rule-required="true" data-msg-required="请填写正确答案" ></textarea>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             答题人
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入答题人" style="width:150px;"    readonly="readonly"  id="datiren" name="datiren" value="<%=request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") :""%>"/>

                            </div>

                        </div>
                    </div>

 <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("referer")%>" />
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