<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	for(int i = 0; i < 10; i++){
		if(i % 2 == 0) out.println(i + "<br />");
	}

	int count = 0;
	
	int a = 10;
	int b = 20;
	int c = 30;

%>

count : <%= ++count %> <br />

date : <%= new java.util.Date() %> <br />

total : <%= a+b+c %> <br />


































for(int i =0; i < 10; i++){
	
	if (i%2 ==0){
		System.out.println("짝수는 아이유");
	}else{
		out.println("홀수는 이지은");
	}//Sysetm.out.println() 사용 하면 콘솔에 떠버림
	
}

<% 
	for (int x=1; x <11; x++){
		for(int y= 1; y < 200; y++){
			if((y/x)%10==0 ){
				out.println(y/x + "   십의 배수 만 출력");
			}
		}
		
	}		
				
%>							




