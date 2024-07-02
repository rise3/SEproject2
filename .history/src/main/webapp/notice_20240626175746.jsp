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
    $就诊须知@
    $一、预约挂号：@
    $1. 除急诊、发热门诊外均须通过微信小程序“哈尔滨医科大学附属第二医院”提前预约挂号（60岁以上老年人可通过“老年人挂号”入口按提示进行电话预约挂号），现场不再放号。@
    $2.每日16:00开放第七日号源。@
    $3.预约成功后请严格按照预约时段提前30分钟就诊，未预约或未到就诊时段不允许进入门诊，挂号当日有效。@
    $4.目前通过微信挂号不支持医保个人账户支付挂号费；如需使用，可通过支付宝“龙江医保移动”小程序预约挂号。@
    $二、医保身份：需在医院使用医保账户的患者，挂号时请选择“医保就诊”。@
    $三、无陪同或一陪同：为减少人群聚集，无特殊情况应独立完成就诊，老年人、未成年人、行动不便者等特殊人群，允许一名人员陪同。@
    $四、退号规定：@
    $1.如需退号，请于预约时间之前，在“挂号记录”中点击“取消挂号”，挂号费将原路返还到您的付款账户。过期号源不予退号，如同意再挂号。@
    $2.医院设有黑名单机制：30天内退号≥5次或一年≥10次，将无法继续预约挂号。@
    $五、挂号费、诊查费：@
    $根据省医保局现行文件“黑医保发［2022］60号”价格标准，我院挂号费1元/次、急诊挂号费2元/次；普通门诊诊查费7元/次、副主任医师诊查费13元/次、主任医师诊查费22元/次，儿科诊查费上浮不超过30%；知名专家门诊诊查费100-300元/次；急诊诊查费15元/次；互联网复诊7元/次@
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
