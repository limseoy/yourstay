<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset='utf-8'>
<c:if test="${empty loginOkUser}">
    <script>
        alert("회원서비스입니다. 먼저 로그인을 해주세요!");
        location.href="../login/loginPage"
    </script>
</c:if>