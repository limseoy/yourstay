<%@ page contentType="text/html; charset=UTF-8" import="yourstay.md.domain.LoginConst"%>
<script>
	if(${result} == <%=LoginConst.NO_ID%>){
		alert("그런 이메일을 가진 회원이 없어요");
		location.href="loginPage";
	}else if(${result} == <%=LoginConst.NO_PWD%>){
		alert("비밀번호가 맞지 않아요");
		location.href="loginPage";
	}else{
		location.href="/";
	}
</script>