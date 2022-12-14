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
        where += " AND datiren='" + request.getSession().getAttribute("username") + "' "; //  设置datiren为当前登录用户
// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
if (request.getParameter("xuexibianhao") != null && !"".equals(request.getParameter("xuexibianhao"))) {where += " AND xuexibianhao LIKE '%" + request.getParameter("xuexibianhao") + "%'"; }
if (request.getParameter("xueximingchen") != null && !"".equals(request.getParameter("xueximingchen"))) {where += " AND xueximingchen LIKE '%" + request.getParameter("xueximingchen") + "%'"; }
if (request.getParameter("suoshuzhangjie") != null && !"".equals(request.getParameter("suoshuzhangjie"))) {where += " AND suoshuzhangjie ='" + request.getParameter("suoshuzhangjie") + "'";}
if (request.getParameter("leixing") != null && !"".equals(request.getParameter("leixing"))) {where += " AND leixing ='" + request.getParameter("leixing") + "'";}
if (request.getParameter("lianxitiid") != null && !"".equals(request.getParameter("lianxitiid"))) { where += " AND lianxitiid='" + request.getParameter("lianxitiid") + "' "; }
List<HashMap> list = Query.make("xuexiguochengcuoti").where(where).order(orderby + " " + sort).page(15);
%>

<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name"> 学习过程错题 </span> <span>列表</span>
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
<div class="form-group">所属章节
<select class="form-control class_suoshuzhangjie424" name="suoshuzhangjie" id="suoshuzhangjie" data-value="<%=request.getParameter("suoshuzhangjie") !=null ? request.getParameter("suoshuzhangjie") :""%>"  style="width:250px;" >
<option value>请选择所属章节</option>
<%List<HashMap> select424 = new CommDAO().select("SELECT * FROM zhangjie ORDER BY id desc");%>
<% for (HashMap m : select424) { %><option value="<%= m.get("id") %>" readonly><%= m.get("zhangjiemingchen") %></option>
<% } %>
</select>
<script>$(".class_suoshuzhangjie424").val($(".class_suoshuzhangjie424").attr("data-value"))</script>

</div>
<div class="form-group">类型
<select class="form-control class_leixing429" name="leixing" id="leixing" data-value="<%=request.getParameter("leixing") !=null ? request.getParameter("leixing") :""%>"  style="width:250px;" >
<option value>请选择类型</option>
<option value="单选题">单选题</option>
<option value="多选题">多选题</option>
<option value="填空题">填空题</option>
</select>
<script>$(".class_leixing429").val($(".class_leixing429").attr("data-value"))</script>

</div>

<div class="form-group">
<select class="form-control" name="order" id="orderby">
<option value="id">按最新发布</option>

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
                            <th >练习题目</th>
                            <th >所属章节</th>
                            <th >类型</th>
                            <th >答题编号</th>
                            <th >答案</th>
                            <th >字母</th>
                            <th >正确答案</th>
                            <th >答题人</th>


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
                            <td><%=map.get("lianxitimu")%>
</td>
                            <td><%HashMap mapsuoshuzhangjie424 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ map.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie424.get("zhangjiemingchen") %></td>
                            <td><%=map.get("leixing")%></td>
                            <td><%=map.get("datibianhao")%>
</td>
                            <td><%=map.get("daan")%>
</td>
                            <td><%=map.get("zimu")%>
</td>
                            <td><%=map.get("zhengquedaan")%>
</td>
                            <td><%=map.get("datiren")%>
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