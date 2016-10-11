<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%= request.getContextPath() %>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<s:url value="/Css/jquery-ui.min.css" />" rel="stylesheet" type="text/css" />
<link href="<s:url value="/lightcolor/gray/jtable.min.css" />"  rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="<s:url value="/Script/jquery-ui.min.js" />" >
	
</script>
<script type="text/javascript" src="<s:url value="/Script/jquery.jtable.min.js" />" >
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#PersonTableContainer').jtable({
			title : 'Table of people',
			actions : {
				listAction : '/GettingStarted/PersonList',
				createAction : '/GettingStarted/CreatePerson',
				updateAction : '/GettingStarted/UpdatePerson',
				deleteAction : '/GettingStarted/DeletePerson'
			},
			fields : {
				PersonId : {
					key : true,
					list : false
				},
				Name : {
					title : 'Author Name',
					width : '40%'
				},
				Age : {
					title : 'Age',
					width : '20%'
				},
				RecordDate : {
					title : 'Record date',
					width : '30%',
					type : 'date',
					create : false,
					edit : false
				}
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="PersonTableContainer"></div>
</body>
</html>