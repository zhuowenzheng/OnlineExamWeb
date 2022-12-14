<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>
<%
        String orderby = util.Request.get("order","id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序
        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误
// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
if (request.getParameter("xuexibianhao") != null && !"".equals(request.getParameter("xuexibianhao"))) {where += " AND xuexibianhao LIKE '%" + request.getParameter("xuexibianhao") + "%'"; }
if (request.getParameter("xueximingchen") != null && !"".equals(request.getParameter("xueximingchen"))) {where += " AND xueximingchen LIKE '%" + request.getParameter("xueximingchen") + "%'"; }
if (request.getParameter("xuexiid") != null && !"".equals(request.getParameter("xuexiid"))) { where += " AND xuexiid='" + request.getParameter("xuexiid") + "' "; }
List<HashMap> list = Query.make("xuexidefen").where(where).order(orderby + " " + sort).page(15);
%>

<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name"> 学习得分 </span> <span>列表</span>
        </div>
        <div class="panel-body">            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?"><!-- form 标签开始 -->
                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div><div class="form-group">学习编号
                        <input type="text" class="form-control" placeholder="输入学习编号关键词" style="width:200px;"     id="xuexibianhao" name="xuexibianhao" value="<%=request.getParameter("xuexibianhao") !=null ? request.getParameter("xuexibianhao") :""%>"/>
</div>
<div class="form-group">学习名称
                        <input type="text" class="form-control" placeholder="输入学习名称关键词" style="width:200px;"     id="xueximingchen" name="xueximingchen" value="<%=request.getParameter("xueximingchen") !=null ? request.getParameter("xueximingchen") :""%>"/>
</div>

<div class="form-group">
<select class="form-control" name="order" id="orderby">
<option value="id">按最新发布</option>
<option value="danxuantidefen">按单选题得分</option>
<option value="duoxuantidefen">按多选题得分</option>
<option value="tiankongtidefen">按填空题得分</option>
<option value="zongdefen">按总得分</option>

</select>
<select class="form-control" name="sort" id="sort"><option value="desc">倒序</option><option value="asc">升序</option></select>
</div>
<script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
<button type="submit" class="btn btn-default">搜索</button>
                    <!--form标签结束-->
                </form>
            </div>            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th >学习编号</th>
                            <th >学习名称</th>
                            <th >答题编号</th>
                            <th >单选题得分</th>
                            <th >多选题得分</th>
                            <th >填空题得分</th>
                            <th >总得分</th>
                            <th >答题人</th>
                            <th >学习时间</th>
                            <th >完成状况</th>

                            <th width="220" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%int i = 0;for (HashMap map : list) {i++; %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center"><label><%= i %></label></td>
                            <td><%=map.get("xuexibianhao")%>
</td>
                            <td><%=map.get("xueximingchen")%>
</td>
                            <td><%=map.get("datibianhao")%>
</td>
                            <td><%=map.get("danxuantidefen")%>
</td>
                            <td><%=map.get("duoxuantidefen")%>
</td>
                            <td><%=map.get("tiankongtidefen")%>
</td>
                            <td><%=map.get("zongdefen")%>
</td>
                            <td><%=map.get("datiren")%>
</td>
                            <td><%=map.get("xuexishijian")%>
</td>
                            <td><%=map.get("wanchengzhuangkuang")%>
</td>

                        <td align="center">
<a href="xuexidefen_detail.jsp?id=<%=map.get("id")%>">详情</a>
<a href="xuexidefen_updt.jsp?id=<%=map.get("id")%>">编辑</a>
<a href="xuexidefen.jsp?a=delete&id=<%=map.get("id")%>" onclick="return confirm('确定要删除？')">删除</a>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                    </table>
            </div> 
            ${page.info}
        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>