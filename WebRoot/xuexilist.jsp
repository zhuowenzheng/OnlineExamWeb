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
if (request.getParameter("xuexibianhao") != null && !"".equals(request.getParameter("xuexibianhao"))) {where += " AND xuexibianhao LIKE '%" + request.getParameter("xuexibianhao") + "%'"; }
if (request.getParameter("xueximingchen") != null && !"".equals(request.getParameter("xueximingchen"))) {where += " AND xueximingchen LIKE '%" + request.getParameter("xueximingchen") + "%'"; }
List<HashMap> list = Query.make("xuexi").where(where).order(orderby + " " + sort).page(15);

%>

<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                  						<div class="pa10 jichu_Search "   style="background: #fff" >
                            <form class="form-inline" id="formSearch71" action="?"><!-- form 标签开始 -->

                                <div class="form-group">
                                    <i class="fa fa-search"></i>
                                </div>
								
                                <div class="form-group">学习编号                         <input type="text" class="form-control" placeholder="输入学习编号关键词" style="width:200px;"     id="xuexibianhao" name="xuexibianhao" value="<%=request.getParameter("xuexibianhao") !=null ? request.getParameter("xuexibianhao") :""%>"/></div>
                                <div class="form-group">学习名称                         <input type="text" class="form-control" placeholder="输入学习名称关键词" style="width:200px;"     id="xueximingchen" name="xueximingchen" value="<%=request.getParameter("xueximingchen") !=null ? request.getParameter("xueximingchen") :""%>"/></div>
                                
                             
                                <div class="form-group">
                                    <select class="form-control" name="order" id="orderby71">
										<option value="id">按最新发布</option>
										
                                        
                                    </select>
                                    <select class="form-control" name="sort" id="sort71">
                                        <option value="desc">倒序</option>
                                        <option value="asc">升序</option>
                                    </select>
                                </div>
                                
                                <script>$("#orderby71").val("<%=orderby%>");
                                $("#sort71").val("<%=sort%>");</script>
                                
								

                                <button type="submit" class="btn btn-primary">搜索</button>
                                <!--form标签结束-->
                            </form>
                        </div>

            </div>
        </div>
    </div>  <!-- container定宽，并剧中结束 -->
</div>
<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                  
<div class="wzlist  "   style="background: #fff" >
                            <% for (HashMap mmap:list ){ %>
                            <div class="row">
                            
                                <div class="col-xs-12 col-md-12">
                                    <a href="xuexidetail.jsp?id=<%=mmap.get("id")%>">
                                        <div class="list-title"><span class="fa fa-angle-double-right"></span>
                                            <%=mmap.get("xueximingchen")%>
                                        </div>
                                        <div class="list-sj"><%=Info.subStr(mmap.get("tianjiashijian"),19,"")%></div>
                                    </a>
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
