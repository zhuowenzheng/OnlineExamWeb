<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<%
        String orderby = util.Request.get("order","id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序
        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误
// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
if (request.getParameter("zhishibiaoti") != null && !"".equals(request.getParameter("zhishibiaoti"))) {where += " AND zhishibiaoti LIKE '%" + request.getParameter("zhishibiaoti") + "%'"; }
if (request.getParameter("suoshuzhangjie") != null && !"".equals(request.getParameter("suoshuzhangjie"))) {where += " AND suoshuzhangjie ='" + request.getParameter("suoshuzhangjie") + "'";}
List<HashMap> list = Query.make("zhishi").where(where).order(orderby + " " + sort).page(15);

%>

<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                              <div class="zp-bti-z  "   style="background: #fff" >
                <div class="zp-title">
                        <span class="zp-mingcheng">
                            <span class="fa fa-chevron-right" style="font-size: 13px">  </span> 知识大全
                        </span>
					
                </div>
                <div class="zpbtnr"> 
                        						<div class="pa10 jichu_Search "   style="background: #fff" >
                            <form class="form-inline" id="formSearch68" action="?"><!-- form 标签开始 -->

                                <div class="form-group">
                                    <i class="fa fa-search"></i>
                                </div>
								
                                <div class="form-group">知识标题                         <input type="text" class="form-control" placeholder="输入知识标题关键词" style="width:200px;"     id="zhishibiaoti" name="zhishibiaoti" value="<%=request.getParameter("zhishibiaoti") !=null ? request.getParameter("zhishibiaoti") :""%>"/></div>
                                <div class="form-group">所属章节 <select class="form-control class_suoshuzhangjie72" name="suoshuzhangjie" id="suoshuzhangjie" data-value="<%=request.getParameter("suoshuzhangjie") !=null ? request.getParameter("suoshuzhangjie") :""%>"  style="width:250px;" >
<option value>请选择所属章节</option>
<%List<HashMap> select72 = new CommDAO().select("SELECT * FROM zhangjie ORDER BY id desc");%>
<% for (HashMap m : select72) { %><option value="<%= m.get("id") %>" readonly><%= m.get("zhangjiemingchen") %></option>
<% } %>
</select>
<script>$(".class_suoshuzhangjie72").val($(".class_suoshuzhangjie72").attr("data-value"))</script>
</div>
                                
                             
                                <div class="form-group">
                                    <select class="form-control" name="order" id="orderby68">
										<option value="id">按最新发布</option>
										
                                        
                                    </select>
                                    <select class="form-control" name="sort" id="sort68">
                                        <option value="desc">倒序</option>
                                        <option value="asc">升序</option>
                                    </select>
                                </div>
                                
                                <script>$("#orderby68").val("<%=orderby%>");
                                $("#sort68").val("<%=sort%>");</script>
                                
								

                                <button type="submit" class="btn btn-primary">搜索</button>
                                <!--form标签结束-->
                            </form>
                        </div>         
                </div>
            </div>

            </div>
        </div>
    </div>  <!-- container定宽，并剧中结束 -->
</div>
<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                  
                         <div class="sxnews "   style="background: #fff" >
                           <% for (HashMap mmap:list ){ %>
                            <div class="sxxwlist row">
                                <a href="zhishidetail.jsp?id=<%=mmap.get("id")%>" class="sxnews-img col-xs-12 col-md-2">
                                    <div class="img-box pb100">
                                        <div class="img" style="background-image: url('<%=Info.images(mmap.get("tupian"))%>')"></div> 
                                    </div>
                                </a>
                                <div class="sxnewtext col-xs-12 col-md-10">

                                    <a href="zhishidetail.jsp?id=<%=mmap.get("id")%>"><h4><%=mmap.get("zhishibiaoti")%></h4></a>

                                    <div class="xwdaodu">
                                       <%=Info.subStr(mmap.get("zhishineirong"),25,"...")%>
                                    </div>
                                    <div class="xwqitazduan">
                                    
                                   <span>所属章节：<%HashMap mapsuoshuzhangjie72 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ mmap.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie72.get("zhangjiemingchen") %></span>
                                    
                                    </div>
                                </div>
                            </div>
                            <% } %>

                        </div>
                        ${page.info}

            </div>
        </div>
    </div>  <!-- container定宽，并剧中结束 -->
</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
