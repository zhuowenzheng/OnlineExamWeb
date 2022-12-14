<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并居中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                              <div class="zp-bti-z  "   style="background: #fff" >
                <div class="zp-title">
                        <span class="zp-mingcheng">
                            <span class="fa fa-chevron-right" style="font-size: 13px">  </span> 知识信息
                        </span>
					
                    <div class="zp-more"><a HREF="zhishilist.jsp">MORE <span class="fa fa-chevron-circle-right"> </span></a>
                    </div>
					
                </div>
                <div class="zpbtnr"> 
                        <%ArrayList<HashMap> zhishilist65 =Query.make("zhishi").order("id desc").limit(8).select(); %>
                    <style>
                        .trust_list .list_i:nth-child(4n+1) {
                            clear:left;
                        }
                    </style>
                    <div class="trust_list "   style="background: #fff" >
                        <div class="row">
                        
                        <% for (HashMap mmap:zhishilist65 ){ %>
                            <div class="col-xs-12 col-md-3 list_i">
                                <div class="single-blog mb-30">
                                    <div class="blog-img">
                                        <a href="zhishidetail.jsp?id=<%=mmap.get("id")%>" class="img-box pb100"><div class="img" style="background-image: url('<%=Info.images(mmap.get("tupian"))%>')"></div></a>
                                        <div class="blog-icon" >
                                            <a class="blog-link" href="zhishidetail.jsp?id=<%=mmap.get("id")%>">
                                                <img src="images/4.png" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="blog-info">
                                     <span><label> 所属章节：</label><%HashMap mapsuoshuzhangjie72 = new CommDAO().find("SELECT zhangjiemingchen FROM zhangjie where id='"+ mmap.get("suoshuzhangjie") + "'");%>
 <%= mapsuoshuzhangjie72.get("zhangjiemingchen") %> </span>
                                        <h3><a href="zhishidetail.jsp?id=<%=mmap.get("id")%>"><%=Info.subStr(mmap.get("zhishibiaoti"),15,"...")%></a></h3>

                                            <img class="b-blog" src="images/3.png" alt="">
                                            <img class="b-none" src="images/5.png" alt="">
                                        </a>
                                    </div>
                                </div>
                            </div> 
                        <% } %> 
                                     
						</div>
                    </div> 
                        
                </div>
            </div>

            </div>
        </div>
    </div>  <!-- container定宽，并居中结束 -->
</div>
<div>
    <div class="container "   style="background: #fff" > <!-- 使用bootstrap css框架，container定宽，并居中 https://v3.bootcss.com/css/#overview-container -->
        <div class="row " >
            <div class="col-xs-12 col-md-12">
                              <div class="zp-bti-z  "   style="background: #fff" >
                <div class="zp-title">
                        <span class="zp-mingcheng">
                            <span class="fa fa-chevron-right" style="font-size: 13px">  </span> 最新学习列表
                        </span>
					
                    <div class="zp-more"><a HREF="xuexilist.jsp">MORE <span class="fa fa-chevron-circle-right"> </span></a>
                    </div>
					
                </div>
                <div class="zpbtnr"> 
                        <%ArrayList<HashMap> xuexilist69 =Query.make("xuexi").order("id desc").limit(4).select(); %>
<div class="wzlist  "   style="background: #fff" >
                            <% for (HashMap mmap:xuexilist69 ){ %>
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
          
                </div>
            </div>

            </div>
        </div>
    </div>  <!-- container定宽，并居中结束 -->
</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
