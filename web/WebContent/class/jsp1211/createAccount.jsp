<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">

  
  <script>

    </script>
  <h1> 회원가입</h1>
	

</head>

	
<body>
  <table boder=""> 
   <form action="createAccount2.jsp" method="post">
       
        <tr>
            <td text-align="center" > 아이디</td>
            <td>
                <input type = "text" name="id"/>
                <input type = "button"  value = "중복확인"/>                
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type = "password" name="pw"/></td>
        </tr>
        <tr>
            <td>성명</td>
            <td><input type = "text" name="nname" /></td>
        </tr>
        <tr>
            <td>성별</td>
            <td>
                <input type = "radio" name ="gender"/ checked> 남자
                <input type = "radio" name ="gender"/> 여자
            </td>
        </tr>
        <tr>
            <td>이메일</td>
            <td>
                <input type="text" name ="email1"/>@<input type="text" name ="email2"/>.<input type="text" name ="email3"/>
            </td>
        </tr>
        
        <tr>
            <td>자기소개</td>
            <td><textarea  name="introducing" cols = "80" rows="20"></textarea></td>
        </tr>
        
  		<tr>
     		<td><input type="submit" value ="가입하기"/></td>
 	 		<td><input type="reset" value ="다시입력"/></td>
  		</tr>
	 </form>
	 
  </table>
  


</body>

</html>