<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>

<%@page import="util.Info" %>
<%@ page import="com.alibaba.fastjson.*" %>
<%@ page import="dao.Query" %>
<%@ page import="util.Request" %>
<%

    if (request.getParameter("f") != null) {


        String json1 = request.getParameter("JSON");
        String id = request.getParameter("id");
        JSONArray json = JSON.parseArray(json1);
        JSONObject leixingdefen = JSON.parseObject(request.getParameter("leixingdefen"));


        HashMap data = new HashMap();

        String kaoshibianhao = Info.getID();
        data.put("datibianhao", kaoshibianhao);
        data.put("datiren", request.getSession().getAttribute("username"));
        data.put("xuexishijian", Info.getDateStr());

        HashMap m = new HashMap();
        for (int i = 0; i < json.size(); i++) {
            JSONObject obj = json.getJSONObject(i);
            obj.putAll(data);
            obj.put("lianxitiid" , obj.get("id"));   // 错题里面记录的是那个试题的id
            obj.remove("id");

            m.putAll(obj);
            int defen = obj.getIntValue("defen");// Integer.valueOf(String.valueOf(obj.get("defen"))).intValue();
            if (defen != -1) {
                if (defen == 0 && request.getParameter("cuoti")==null) {
                    Query.make("xuexiguochengcuoti").add(m);
                }else{
                    if(defen > 0 && request.getParameter("cuoti")!=null){
                        // 删除该错题
                        Query.make("xuexiguochengcuoti").where("shitiid" , obj.get("shitiid")).delete();
                    }
                }
            }
            Query.make("xuexiguochengjilu").add(m);
        }

        HashMap jieguo = new HashMap();
        jieguo.putAll(m);


        Integer total = Integer.valueOf(request.getParameter("zongdefen"));

        String duoxuantidefen= String.valueOf( leixingdefen.get("多选题") )  ;
        String danxuantidefen= String.valueOf( leixingdefen.get("单选题")) ;

        jieguo.put("datibianhao", kaoshibianhao);
        jieguo.put("danxuantidefen", danxuantidefen.equals("") || danxuantidefen.equals("null") ? "0":danxuantidefen );
        jieguo.put("duoxuantidefen",  duoxuantidefen.equals("") || duoxuantidefen.equals("null") ? "0":duoxuantidefen);




        jieguo.put("zongdefen", total);
        jieguo.put("wanchengzhuangkuang", total >= 60 ? "及格,推荐您纠正错题" : "不及格，推荐您浏览一下章节知识");
        jieguo.put("xuexishijian", Request.get("time"));



        long insertId = Query.make("xuexidefen").insert(jieguo);

        out.clear();
        out.clearBuffer();
        out.println("{code:0,data:" + insertId + "}");
        out.close();
    } else {
        out.println("{code:1,msg:\"信息提交失败\"}");
        out.close();
    }
%>