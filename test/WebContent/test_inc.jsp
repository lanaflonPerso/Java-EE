<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		ArrayList<Integer> liste = new ArrayList<Integer>();
		liste.add( 12 );
		out.println( liste.get( 0 ) );
		%>
	</body>
</html>