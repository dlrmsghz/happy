<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainLayout</title>
</head>

<body>
	
	<script>
	
	function check(){
		
		var prac = document.prac;
		
		if(!prac.id.value){
			alert("insert ID!");
			return false;
			
		}
		if(prac.id.value.length<3||prac.id.value.length>15){
			alert("ID chracters should be more than 3 but no more than 20!");
			return false;
		}
		if(prac.pw.value!=prac.confirmPw.value){
			alert("Check your password again!");
			return false;
		}
		if(!prac.name.value){
			alert("Insert Name!");
			return false;
		}
		if(!prac.age.value){
			alert("Insert Age!");
			return false;
		}
		if(!prac.gender.value){
			alert("Choose Gender!");
			return false;
		}
		if(!prac.email.value){
			alert("Insert Email!");
			return false;
		}

		if(prac.sweet.checked==false&& 
				prac.salty.checked==false&& 
				prac.sour.checked==false&& 
				prac.spicy.checked==false&& 
				prac.bitter.checked==false&& 
				prac.RED.checked==false){
			alert("Choose at least one flavor!");
			return false;
		}
		if(!prac.animal.selectedIndex){
			alert("Choose your favorite animal!");
			return false;
		}
		if(!prac.bio.value){
			alert("Insert bio!");
			return false;
		}
		if(prac.bio.value.length>100){
			alert("bio must be shorter than 100 letters!");
			return false;
		}
	}
	
	
	
	
	</script>



	
	<table border="">
		<tr>
			<td colspan="2"> <jsp:include page="header.jsp"/></td>
		
		</tr>
		<tr>
			<td style = "text-align: center;"> 
				<jsp:include page="left.jsp"/>
			</td>
	
	
			<td>
				
				<form action ="record.jsp" method ="post" name ="prac" onsubmit ="return check()" > 
					<table border="">
						
						<tr>
							<td>ID <br/>							
								<input type="text" name="id" style="width: 150px;"/>
								<input type="button" value="Duplicate Check"/> 
							</td>	
									
						</tr>
						
						<tr>
							<td>PW <br/> <input type="password" name="pw" style="width: 150px;"/>			
									
					
							<br/>Confirm PW <br/> <input type="password" name="confirmPw" style="width: 150px;"/></td>			
									
						</tr>
						
						<tr>
							<td>Name <br/><input type="text" name="name" style="width: 150px;"/></td>		
									
						</tr>
						
						<tr>
							<td>Age <br/><input type="text" name="age" style="width: 150px;"/></td>		
									
						</tr>
						
						<tr>
							<td>Gender<br/>
								Male<input type="radio" name="gender" value="male" style="width: 60px;"/>			
							    Female<input type="radio" name="gender" value="female"/>
						    </td>	
									
						</tr>
						
						<tr>
							<td>Email<br/><input type="email" name="email" style="width: 400px;"/></td>	
									
						</tr>
						
						<tr>
							<td>flavor<br/>
								Sweet<input type="checkbox" name="sweet" value="sweet" style="width: 30px;"/>		
								Salty<input type="checkbox" name="salty" value="salty" style="width: 30px;"/>				
								Sour<input type="checkbox" name="sour" value="sour" style="width: 30px;"/>				
								Spicy<input type="checkbox" name="spicy" value="spicy" style="width: 30px;"/>	
								Biter<input type="checkbox" name="bitter" value="bitter" style="width: 30px;"/>	
								Red<input type="checkbox" name="RED" value="RED" style="width: 30px;"/>	</td>			
										
						</tr>
						
						<tr>
							<td>Favorite animal
								<select name="animal" style="width : 60px" >
								<option value="blank"></option>		
								<option value="dog">dog</option>
								<option value="cat">cat</option>
								<option value="lion">lion</option>
								<option value="tiger">tiger</option>
								<option value="bear">bear</option>
								</select>
							</td>
								
									
						</tr>
						
						<tr>
							<td><textarea name ="bio" rows="25" cols="60" style="text =align: left"></textarea></td>
									
						</tr>
		
						<tr>
							<td><br/><input type="submit" value="Sign in"/></td>
									
						</tr>
						
					</table>
				</form>		
			</td>
		</tr>	
		<tr>
			<td colspan="2"><jsp:include page ="bottom.jsp"/></td>
		</tr>
	  
	</table>
	
	




</body>
</html>