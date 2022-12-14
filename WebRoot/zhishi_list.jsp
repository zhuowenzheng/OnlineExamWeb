<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
<script>
    alert('对不起,请您先登陆!');
    location.href = 'login.jsp';
</script>
<%
        return;
    } %>
<%
    String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序
    String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误
// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
    if (request.getParameter("zhishibiaoti") != null && !"".equals(request.getParameter("zhishibiaoti"))) {
        where += " AND zhishibiaoti LIKE '%" + request.getParameter("zhishibiaoti") + "%'";
    }
    if (request.getParameter("suoshuzhangjie") != null && !"".equals(request.getParameter("suoshuzhangjie"))) {
        where += " AND suoshuzhangjie ='" + request.getParameter("suoshuzhangjie") + "'";
    }
    List<HashMap> list = Query.make("zhishi").where(where).order(orderby + " " + sort).page(15);
%>

<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 知识 </span> <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?"><!-- form 标签开始 -->
                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>
                    <div class="form-group">知识标题
                        <input type="text" class="form-control" placeholder="输入知识标题关键词" style="width:200px;"
                               id="zhishibiaoti" name="zhishibiaoti"
                               value="<%=request.getParameter("zhishibiaoti") !=null ? request.getParameter("zhishibiaoti") :""%>"/>
                    </div>
                    <div class="form-group">所属章节
                        <select class="form-control class_suoshuzhangjie72" name="suoshuzhangjie" id="suoshuzhangjie"
                                data-value="<%=request.getParameter("suoshuzhangjie") !=null ? request.getParameter("suoshuzhangjie") :""%>"
                                style="width:250px;">
                            <option value>请选择所属章节</option>
                            <%List<HashMap> select72 = new CommDAO().select("SELECT * FROM zhangjie ORDER BY id desc");%>
                            <% for (HashMap m : select72) { %>
                            <option value="<%= m.get("id") %>" readonly><%= m.get("zhangjiemingchen") %>
                            </option>
                            <% } %>
                        </select>
                        <script>$(".class_suoshuzhangjie72").val($(".class_suoshuzhangjie72").attr("data-value"))</script>

                    </div>

                    <div class="form-group">
                        <select class="form-control" name="order" id="orderby">
                            <option value="id">按最新发布</option>

                        </select>
                        <select class="form-control" name="sort" id="sort">
                            <option value="desc">倒序</option>
                            <option value="asc">升序</option>
                        </select>
                    </div>
                    <script>$("#orderby").val("<%= orderby %>");
                    $("#sort").val("<%= sort %>");</script>
                    <button type="submit" class="btn btn-default">搜索</button>
                    <!--form标签结束-->
                </form>
            </div>
            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th>知识标题</th>
                        <th>图片</th>
                        <th>所属章节</th>
                        <th>添加时间</th>

                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center"><label><%= i %>
                        </label></td>
                        <td><%=map.get("zhishibiaoti")%>
                        </td>
                        <td><% if ("".equals(map.get("tupian"))) { %>-<% } else { %><img width="100px"
                                                                                         src="<%=map.get("tupian")%>"/> <% } %>
                        </td>
                        <td><%
                            HashMap mapsuoshuzhangjie72 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='" + map.get("suoshuzhangjie") + "'");%>
                            <%= mapsuoshuzhangjie72.get("zhangjiemingchen") %>
                        </td>
                        <td><%=Info.subStr(map.get("tianjiashijian"), 19, "")%>
                        </td>

                        <td align="center">
                            <a href="zhishi_detail.jsp?id=<%=map.get("id")%>">详情</a>
                            <a href="zhishi_updt.jsp?id=<%=map.get("id")%>">编辑</a>
                            <a href="zhishi.jsp?a=delete&id=<%=map.get("id")%>"
                               onclick="return confirm('确定要删除？')">删除</a>
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