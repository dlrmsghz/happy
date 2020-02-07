<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>


function check(){
	//var ID=document.getElementById("ID");
	var checkkk=document.checkk;
	if(!checkkk.ID.value){
		alert("내용 기입좀요");
		
		return false;
	}	
}

</script>



</head>
<body>

	<table width="400" border="1">
		<tr>
			<td colspan="2">
				<jsp:include page="layoutheader.jsp" />
			</td>
		</tr>
		
		<tr>
			<td>
				<jsp:include page="layoutleft.jsp" >
					<jsp:param value="<%='a' %>" name ="a"/>
				</jsp:include>
			</td>

			<td>
				<form action="NEWPRO.jsp" method="post" name ="checkk" onsubmit ="return check()" >

					<table>
						<tr>
							<td>ID : <br /> <input type="text" name="ID"
								placeholder="                @gmail.com" />
							</td>
						</tr>

						<tr>
							<td>PW : <br /> <input type="text" name="PW"
								style="text-align: left; width: 200px;"
								placeholder="7자 이내 영문자 혼합 사용" />
							</td>
						</tr>

						<tr>
							<td>PW_RECHECK: <br /> <input type="text" name="REPW"
								style="text =align: left; width: 200px;" placeholder="비밀번호 재 입력" />
							</td>
						</tr>

						<tr>
							<td>NAME :<br /> <input type="text" name="NAME" />
							</td>
						</tr>

						<tr>
							<td>DATE_OF_BIRTH: <br /> <input type="text" name="BIRTH"
								style="text =align: left; width: 150px;"
								placeholder="YYYY-MM-DD" />
							</td>
						</tr>

						<tr>
							<td>GENDER :<br /> <select name="GENDER"
								style="text =align: left; width: 150px;">
									<option value="GENDER" selected>gender</option>
									<option value="male">male</option>
									<option value="female">female</option>
							</select>
							</td>
						</tr>

						<tr>
							<td>HOBBIES <br /> <input type="checkbox" name=hobbies
								valuse="MUSIC" /> MUSIC <input type="checkbox" name=hobbies
								valuse="BAKING" /> BAKING <input type="checkbox" name=hobbies
								valuse="TRAVEL" /> TRAVEL <input type="checkbox" name=hobbies
								valuse="MOVIES" /> MOVIES
							</td>
						</tr>


						<tr>
							<td>NUMBER <br /> <select name="NUMBER">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="019">019</option>
									<option value="016">016</option>
							</select> <input type="text" name="MIDNUMBER" /> <input type="text"
								name="LASTNUMBER" />
							</td>
						</tr>

						<tr>
							<td><font size="5"> PRESS "회원가입" BUTTON FOR SIGN UP ▶</font>
								<input type="submit" value="회원 가입 " /></td>
						</tr>

					</table>
				</form>
			</td>

		 </tr>
		<tr>
			<td colspan="2">
					<jsp:include page ="footer.jsp"/>
			푸터</td>
		</tr>
	</table>

</body>
</html>