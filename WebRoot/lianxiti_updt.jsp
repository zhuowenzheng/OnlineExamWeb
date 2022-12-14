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
 HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "lianxiti");%>

<div style="padding: 10px" class="admin-content">

    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑 练习题:</div>
            <div class="panel-body">
       <form action="lianxiti.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

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
                             所属章节<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                            <select class="form-control class_suoshuzhangjie422" name="suoshuzhangjie" id="suoshuzhangjie" data-value="<%=Info.html(mmm.get("suoshuzhangjie"))%>"  data-rule-required="true" data-msg-required="请选择所属章节" style="width:250px;" >
<option value>请选择所属章节</option>
<%List<HashMap> select422 = new CommDAO().select("SELECT * FROM zhangjie ORDER BY id desc");%>
<% for (HashMap m : select422) { %><option value="<%= m.get("id") %>" readonly><%= m.get("zhangjiemingchen") %></option>
<% } %>
</select>
<script>$(".class_suoshuzhangjie422").val($(".class_suoshuzhangjie422").attr("data-value"))</script>


                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             练习题目<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                            <textarea style="width:80%;height:150px;max-width:90%;min-height:120px" class="form-control" palaceholder="输入练习题目"  id="lianxitimu"   name="lianxitimu"   data-rule-required="true" data-msg-required="请填写练习题目" ><%=Info.html(mmm.get("lianxitimu"))%></textarea>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             类型<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                            <select class="form-control class_leixing312" name="leixing" id="leixing" data-value="<%=Info.html(mmm.get("leixing"))%>"  data-rule-required="true" data-msg-required="请选择类型" style="width:250px;" >
<option value>请选择类型</option>
<option value="单选题">单选题</option>
<option value="多选题">多选题</option>
<option value="填空题">填空题</option>
</select>
<script>$(".class_leixing312").val($(".class_leixing312").attr("data-value"))</script>


                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             正确答案<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                    <input type="text" class="form-control" placeholder="输入正确答案" style="width:400px;"    data-rule-required="true" data-msg-required="请填写正确答案"  id="zhengquedaan" name="zhengquedaan" value="<%=Info.html(mmm.get("zhengquedaan"))%>"/>

                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <div class="row">

                            <label style="text-align: right" class="col-sm-2 hiddex-xs">
                             答案<span style="color: red;">*</span>
                            </label>
                            <div class="col-sm-10">

                                                            
                                <div id="TypeFieldabc">
                                    <div style="border: 1px solid #ededed; border-radius: 5px; padding: 10px; background: #F2F2F2">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th width="80">字母</th>
                                                    <th>答案</th>
                                                    <!--<th width="80">跳转序号</th>-->
                                                    <th width="60">得分</th>
                                                    <th width="60">操作</th>
                                                </tr>
                                            </thead>
                                            <tbody id="field_box"></tbody>
                                        </table>
                                    </div>
                                    <button type="button" class="btn btn-default" id="add_btn">增加答案</button>
                                </div>
                            <input type="hidden" id="daan" name="daan" />
                                <script>
                                    function selectType(obj) {
                                        var v = $(obj).val();
                                        if (v == "单选题" || v == "多选题") {
                                            $("#TypeFieldabc").show();
                                        } else {
                                            $("#TypeFieldabc").hide();
                                        }
                                    }

                                    function updateZimu() {
                                        var zimu = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                                        var index = $("#field_box")
                                            .find("tr")
                                            .each(function (index) {
                                                $(this).find("td:eq(0)").find("input").val(zimu.substr(index, 1));
                                            });
                                    }

                                    function addFieldItem(wx) {
                                        wx = wx || {};
                                        var str = [];
                                        str.push('<tr><td align="center" valign="middle">');
                                        str.push('<input type="text" readonly="readonly" style="width: 40px;" data-id="zimu" class="form-control" value="" />');
                                        str.push("</td><td>");
                                        str.push(
                                            '<input type="text" style="width:100%" onblur="updateData()" data-id="title" class="form-control" value="' + (wx.title || "") + '" />'
                                        );
                                        str.push("</td><td>");

                                        str.push(
                                            '<input type="number" step="1" style="width: 60px;" onblur="updateData()" data-id="point" class="form-control" value="' +
                                                (wx.point || "0") +
                                                '" />'
                                        );
                                        str.push("</td><td>");

                                        str.push('<button onclick="delItem(this);" type="button" class="btn btn-default">删除</button>');
                                        str.push("</td></tr>");
                                        var html = str.join("");
                                        $("#field_box").append(html);
                                        updateZimu();
                                    }

                                    function delItem(obj) {
                                        if (confirm("此操作将不可恢复，您确定删除？")) {
                                            $(obj).parent().parent().remove();
                                        }
                                        updateZimu();
                                    }
                                    $(function () {
                                        var __fields = <%=mmm.get("daan")%>;
                                        if (__fields.length > 0) {
                                            $.each(__fields, function () {
                                                addFieldItem(this);
                                            });
                                        } else {
                                            addFieldItem();
                                        }
                                    });

                                    function updateData() {
                                        var result = [];
                                        $("#field_box")
                                            .find("tr")
                                            .each(function () {
                                                var obj = {};
                                                $(this)
                                                    .find("[data-id]")
                                                    .each(function () {
                                                        if ($(this).attr("type") == "checkbox") {
                                                            obj[$(this).attr("data-id")] = $(this).attr("checked");
                                                        } else {
                                                            obj[$(this).attr("data-id")] = $.trim($(this).val());
                                                        }
                                                    });
                                                if (obj.title != "" && obj.point != "") {
                                                    result.push(obj);
                                                }
                                            });
                                        $("#daan").val(JSON.stringify(result));
                                    }

                                    $("#TypeFieldabc").on("input,checkbox", "blur,change", function (e) {
                                        console.log(e);
                                    });

                                    $("#add_btn").click(addFieldItem);
                                    $("#form1").submit(function () {
                                        updateData();
                                        return true;
                                    });
                                </script>
                                
                                

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