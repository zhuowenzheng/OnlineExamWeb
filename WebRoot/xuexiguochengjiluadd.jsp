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

    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>       
    
    <% Map readMap = Query.make("lianxiti").where("id", request.getParameter("id")).find(); %>

<script src="js/jquery.validate.js"></script><div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
     <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="zp-bti-z  "   style="background: #fff" >
                <div class="zp-title">
                        <span class="zp-mingcheng">
                            <span class="fa fa-chevron-right" style="font-size: 13px">  </span> 学习过程记录添加
                        </span>
					
                </div>
                <div class="zpbtnr"> 
                        <form action="xuexiguochengjilu.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

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
                             所属章节
                            </label>
                            <div class="col-sm-10">

                            <%HashMap mapsuoshuzhangjie425 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ readMap.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie425.get("zhangjiemingchen") %> <input type="hidden" id="suoshuzhangjie" name="suoshuzhangjie" value="<%= Info.html(readMap.get("suoshuzhangjie")) %>" />

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
                             得分<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="number" class="form-control" placeholder="输入得分" style="width:150px;"    step="0.01" data-rule-required="true" data-msg-required="请填写得分" number="true" data-msg-number="输入一个有效数字"  id="defen" name="defen" value="0"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             字母(所选字母)
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入字母" style="width:200px;"     id="zimu" name="zimu" value=""/>

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
        </div>
     </div>
  </div>
</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
