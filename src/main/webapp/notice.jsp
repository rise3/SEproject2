<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String usertype = (String) session.getAttribute("usertype");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="css/login1.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/notice.css">
    <%--    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var state = ${requestScope.stateUser};
            if(state == "1") {
                alert("用户名不存在!");
            } else {
                if(state == "2"){
                    alert("密码错误");
                }
            }
            $(location).attr('href', 'login1.jsp');
        });
    </script>
</head>
<body>
<div>
    <h1>公告</h1>
    <p id="notice">挂号</p>
    <p id="notice">就诊须知</p>
    <p id="notice">一、预约挂号：</p>
    <p id="notice">1.每日早晨开放第七日号源。</p>
    <p id="notice">2.预约成功后请严格按照预约时段提前30分钟就诊，未预约或未到就诊时段不允许进入门诊，挂号当日有效。</p>
    <p id="notice">二、无陪同或一陪同：为减少人群聚集，无特殊情况应独立完成就诊，老年人、未成年人、行动不便者等特殊人群，允许一名人员陪同。</p>
    <p id="notice">三、挂号费、诊查费：</p>
    <p id="notice">根据省医保局现行文件价格标准，副主任医师诊查费20元/次、主任医师诊查费40元/次</p>
    <form action="handleNotice" method="post">
        <input type="hidden" name="usertype" value="<%= usertype %>">
        <input type="submit" value="我已阅读并同意">
    </form>
</div>
<div id="footer">
    <div class="foot_content">
        CopyRight &copy; 2024 www.hit.edu.cn 哈尔滨工业大学
    </div>
    <div class="foot_content">

    </div>
</div>
</body>
</html>
