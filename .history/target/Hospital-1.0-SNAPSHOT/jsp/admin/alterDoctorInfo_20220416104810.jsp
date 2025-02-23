<%--
  Created by IntelliJ IDEA.
  User: Mus1tang
  Date: 2021/6/6
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>

<%--患者用户点击注册按钮后来到注册页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <link rel="stylesheet" href="../../css/addDoctor.css">
    <head>
        <title>修改医生信息</title>
        <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>

    </head>
    <body>
        <form action="/admin?method=alterDoctor&doctorId=${doctor.id}" method="post" id="SignupForm" class="signup">

            <div>
                <p>
                    医生姓名:<input type="text" name="name" value="${doctor.name}" readonly>
                </p>
            </div>

            <div>
                <p>
                    医生年龄:<input type="text" name="age" value="${doctor.age}">
                </p>
            </div>

            <div>
                <p>
                    医生性别:<input type="text" name="sex" value="${doctor.sex}" readonly>
                </p>
            </div>

            <div>
                <p>
                    医生职称:<input type="text" name="title" value="${doctor.title}">
                </p>
            </div>

            <div>
                <p>
                    医生专长:<input type="text" name="speciality" value="${doctor.speciality}">
                </p>
            </div>

            <div>
                <p>
                    医生科室:<input type="text" name="departmentName" value="${doctor.department.name}">
                </p>
            </div>

            <div>
                <p>
                    用户名:<input type="text" name="username" value="${doctor.username}" >
                </p>
            </div>

            <div>
                <p>
                    密码:<input type="password" name="password" value="${doctor.password}" readonly>
                </p>
            </div>

            <input type="submit" value="提交" id="submit">
        </form>
    </body>
</html>

<div id="footer">
    <div class="foot_content">
        CopyRight &copy; 2024 www.hit.edu.cn 中国农业大学
    </div>
    <div class="foot_content">
        
    </div>
</div>