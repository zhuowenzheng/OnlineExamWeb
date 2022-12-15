<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
<script>
    alert('对不起,请您先登陆!');
    location.href = 'index.jsp';
</script>
<%
        return;
    } %>
<%
    HashMap map = Query.make("xuexi").where("id", request.getParameter("id")).find();
%>

<div>
    <div class="container " style="background: #fff">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row ">
            <div class="col-xs-12 col-md-12">
                <div class="news-detail " style="background: #fff">
                    <div class="news-biaoti">
                        <%=map.get("xueximingchen")%>
                    </div>
                    <div class="news-qitaziduan">
                        <!-- -->
                    </div>
                    <div class="news-neirong">
                        <%=map.get("xuexijieshao")%>
                    </div>

                    <!-- 开始代码开始 -->
                    <link rel="stylesheet" href="js/layer/theme/default/layer.css">
                    <script src="js/layer/layer.js"></script>
                    <script src="js/paper.js"></script>
                    <style>
                        #zhangjielianxi {
                            padding: 20px;
                            background: #f2f2f2;
                        }

                        #zhangjielianxi div {
                            padding: 20px;
                        }

                        #zhangjielianxi div h3 {
                            margin-bottom: 8px;
                        }

                        .shuxiang #zhangjielianxi .daan label {
                            display: block;
                        }

                        .tiku-message-zhengque, .tiku-message-jiexi {
                            padding: 10px;
                            padding-left: 100px;
                            margin-top: 10px;
                            background: #cdcdcd;

                            display: none;
                        }

                        .tiku-message-zhengque:before {
                            content: '正确答案：';
                            display: inline;
                            float: left;
                        }

                        .tiku-message-jiexi:before {
                            content: "解析：";
                            display: inline;
                            float: left;
                        }
                    </style>

                    <%
                        // LIMIT 题目数
                        List<HashMap> wenda = Query.make("lianxiti").where("xuexiid", map.get("id")).where("leixing", "单选题").order("rand()").limit(5).select();
                        wenda.addAll(Query.make("lianxiti").where("xuexiid", map.get("id")).where("leixing", "多选题").order("rand()").limit(5).select());
                        wenda.addAll(Query.make("lianxiti").where("xuexiid", map.get("id")).where("leixing", "填空题").order("rand()").limit(5).select());


                    %>
                    <div id="xuexi"></div>
                    <script>
                        window.isKaoshi = false;
                        (function () {

                            new paper('#xuexi', {
                                list:<%=JSONArray.toJSONString(wenda)%>,
                                daan: 'daan',//设置答案字段
                                leixing: 'leixing', // 设置类型字段
                                danxuanti: '单选题',  // 设置单选类型
                                duoxuanti: '多选题',  // 设置多选类型
                                biaoti: 'lianxitimu',    // 设置标题字段
                                isShuxiang: true, // false 横向摆放、true 一行一个选项
                                //jiexi: 'daanjieshi', // 设置解析字段 没有就去掉
                                zhengquedaan: 'zhengquedaan', // 设置正确答案字段
                                isRequired: true, // 是否所有的题目都要选择后才可以提交
                                submit: function (result, zongdefen, leixingdefen, time) {
                                    var index = layer.load(0, {
                                        shade: [0.5, '#000'] //0.1透明度的白色背景
                                    });
                                    //设置提交考试结果地址
                                    $.post("jiaojuan_insert.jsp?f=f", {
                                        JSON: JSON.stringify(result),
                                        zongdefen: zongdefen,
                                        leixingdefen: JSON.stringify(leixingdefen),
                                        time: time,
                                        id:<%=request.getParameter("id")%>
                                    }, function (res) {
                                        layer.close(index);
                                        var re = eval("(" + res + ")");
                                        if (re.code == 0) {
                                            layer.alert("提交成功", function () {
                                                window.isKaoshi = false;
                                                //设置提交完成后跳转地址
                                                location.href = 'xuexidefendetail.jsp?id=' + re.data;
                                            });
                                        } else {
                                            layer.alert(re.msg);
                                        }

                                    });
                                }
                            });
                            window.addEventListener('beforeunload', function (e) {
                                if (window.isKaoshi) {
                                    var confirmationMessage = '你当前正在考试，确定离开？';
                                    (e || window.event).returnValue = confirmationMessage; // 兼容 Gecko + IE
                                    return confirmationMessage; // 兼容 Gecko + Webkit, Safari, Chrome
                                }
                            })
                        })();
                    </script>
                    <!-- 开始代码结束 -->


                </div>
            </div>
        </div>  <!-- container定宽，并剧中结束 -->
    </div>
    <%@ include file="footer.jsp" %>
    <%@ include file="foot.jsp" %>
