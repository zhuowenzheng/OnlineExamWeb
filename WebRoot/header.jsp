<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<div class="header "   >
    <div class="head_top">
        <div class="container">
            <div class="row">
                <div class="wrap clearfix">
                    <div class="logo fl"><a href="./"><span class="logozt">Java学习平台</span></a></div>
                    <div class="head_contact_group fr">
                        <% if (request.getSession().getAttribute("username") != null && !("".equals(request.getSession().getAttribute("username")))) { %>
						 欢迎<%= request.getSession().getAttribute("username") != null ? request.getSession().getAttribute("username") : "" %>登录 <a href="main.jsp"> <%= request.getSession().getAttribute("cx") != null ? request.getSession().getAttribute("cx") : "" %> </a> <a href="logout.jsp" onclick="return confirm('你确定退出？')"> 退出</a>
                <% } else { %>
						 
							<button class="btn btn-primary"  data-toggle="modal" data-target="#myModal">登录</button>
						 
						 
				 <% } %>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="head_btm">
        <div class="wrap clearfix">

            <div class="container">
                <div class="row">
                    <div class="nav fl">
                        <ul>
                        
                         <li class="nav_two">
                                <div class="nav_top"><a href="index.jsp">首页</a></div>
                                
                            </li>
						

                         <li class="nav_two">
                                <div class="nav_top"><a href="zhishilist.jsp">知识大全</a></div>
                                
                            </li>
						

                         <li class="nav_two">
                                <div class="nav_top"><a href="xuexilist.jsp">学习信息</a></div>
                                
                            </li>
						

                         <li class="nav_two">
                                <div class="nav_top"><a href="xueshengadd.jsp">用户注册</a></div>
                                
                            </li>
						

                         <li class="nav_two">
                                <div class="nav_top"><a href="main.jsp">后台管理</a></div>
                                
                            </li>
						
  
                        </ul>
                    </div>

                    <div class="head_btm_right fr">

                        <div class="head_search search_icon fl"><img src="images/head_search_pc.png" alt=""></div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="search_popup">
        <form  action="#">
            <input type="text" class="search_text" placeholder="输入关键词搜索..." value="" name="">
            <input type="submit" value="提交" class="search_btn">
        </form>
        <a href="javascript:;" class="input_close">×</a>
    </div>
</div>

<!-- 移动端头部 -->
<div class="phone_header">
    <div class="flex_center">
        <div class="phone_left"><a href="#"><span class="logozt">知识和习题学习平台</span></a></div>
        <div class="phone_center flex_1"></div>
        <div class="phone_right">
            <span class="menu"><img src="images/nav_icon.png" alt=""></span>
        </div>
    </div>
</div>

<!-- 移动端搜索 -->
<div class="dm_box">
    <div class="flex_center row">

        <form action="#">
            <div class="col-xs-10 ">
                <input type="text" class="dm_text form-control" placeholder="输入关键词搜索..." value="" name="">
            </div>
            <div class="col-xs-2"><input type="submit" value="搜索" class="btn btn-primary"></div>
        </form>
    </div>
</div>
<!-- 移动端侧边导航 -->
<div class="phone_nav">
    <div class="phone_mask"></div>
    <div class="phone_nav_right">
        <ul class="phone_nav_list">
         
            <li><a href="index.jsp">首页</a></li>
          

            <li><a href="zhishilist.jsp">知识大全</a></li>
          

            <li><a href="xuexilist.jsp">学习信息</a></li>
          

            <li><a href="xueshengadd.jsp">用户注册</a></li>
          

            <li><a href="main.jsp">后台管理</a></li>
          
   
        </ul>
    </div>
</div>
<script>
    //PC
    $(function () {
           //开启搜索弹窗
        $(".search_icon").on("click", function () {
            $(".search_popup").toggle("")
        })

        //关闭搜索弹窗
        $(".input_close").on("click", function () {
            $(".search_popup").fadeOut()
        })

        $(".top").on("click", function () {
            $("html,body").animate({"scrollTop": "0"}, 500)
        })
    })

    //移动端
    //侧边导航
    $(function () {
        $(".menu").on("click", function () {
            $(".phone_mask").fadeIn()
            $(".phone_nav_right").animate({right: "0"}, 1000);
        })

        $(".phone_mask").on("click", function () {
            $(".phone_nav_right").animate({right: "-60%"}, 1000);
            $(".phone_mask").fadeOut()
        })

        //收缩展开
        $(".level").on("click", function () {
            $(this).next().slideToggle();
        })

    })
</script>


<!-- Modal 登录弹窗 -->
    
<!-- Modal 登录弹窗 -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">登录</h4>
            </div>
            <div class="modal-body">

                <form action="login?ac=login&a=a" method="post" class="form-horizontal" style="padding: 25px">
                    <div >
                        <div class="form-group">
                            <input type="text" placeholder="用户名" class="form-control" name="username" value=""/>
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="密码" class="form-control" name="pwd" value=""/>
                        </div>
                        <div class="form-group">
                            <select name="cx" class="form-control" id="cx">
                               
                                <option value="学生">学生</option>
                               

                            </select>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="验证码" name="pagerandom"
                                       value=""/>
                                <span class="input-group-addon">
                                    <img src="image.jsp" style="width: 60px;height: 20px;max-width: 60px;max-height: 20px"
                                         onclick="this.src='image.jsp?rand='+new Date().getTime()"/>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">登录</button>

                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<!--登录弹窗结束-->

<div style="clear:both"></div>