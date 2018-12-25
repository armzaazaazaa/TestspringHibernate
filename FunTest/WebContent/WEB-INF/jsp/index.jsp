<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>
<%@ page import="java.text.*"%>
<%
	List<Users> userlist = (List<Users>) session.getAttribute("userlist");


String notlogin = (String) session.getAttribute("notlogin");
%>

<!DOCTYPE html>
<html>
<head>

<!-- global -->
<link rel="stylesheet" type="text/css" href="css/global/bootstrap.min.css">
<script type="text/javascript" src="js/global/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="js/global/bootstrap.min.js"></script>
<script type="text/javascript" src="js/global/popper.min.js"></script>
<!-- global -->

<link rel="stylesheet" type="text/css" href="css/from.css">
<script type="text/javascript" src="js/fromjs.js"></script>



<script>

$( document ).ready(function() {

	if($('#typelogin').val() == 1){
	/* 	alert('บ่ถูก') */

		$('#Modallogout').modal('show')

	}
});

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body align='center'>




	<div class="container">
		 <nav class="navbar navbar-expand-lg navbar-light bg-light">
		

		 <input id="typelogin" type="hidden" value="<%=notlogin%>" >
    <a class="navbar-brand" href="#">เข้าระบบ</a>
  </nav>

		<div class="row">
		<div class ="col-lg-12">
			<center><label class="">login</label></center>
			<form  id ="login" action="login" method="post" >
			
				<center><div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="email" name="emaillogin"
						aria-describedby="emailHelp" placeholder="Enter email">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="password" name="passwordlogin"
						placeholder="Password">
				</div>

				<button type="submit" class="btn btn-primary">login</button>
			</form>
		</div>
		</div></center>
		<br>
		<div class="col-lg-6">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal">ลงทะเบียน</button>

		</div>

	
		
		

		<br> <br>




		

	</div>





</body>

</html>



<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<form id="inserintofrom" action="inserfrom" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="email" name="email"
							value="" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Password">
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
				</form>
			</div>
		</div>
	</div>
</div>





<!-- แก้ไข
 -->

<div class="modal fade" id="exampleModaledit" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<form id="inserintofrom" action="inserfromedit" method="post">
				
			<input type = "hidden" id = "idfrom" name= "idfrom">
			
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="text" class="form-control" id="emailedit" name="emailedit"
							>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="text" class="form-control" id="passwordedit"
							name="passwordedit">
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="exampleModaldel" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">ลบป่ะหละ</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<form id="inserintofrom" action="inserfromdel" method="post">
				
			<input type = "hidden" id = "idfromdel" name= "idfromdel">
			
					<div class="form-group">
						<label for="exampleInputEmail1">คุณต้องการที่จะลบใช้หรือไม่?</label> 
					</div>
					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">ยกเลิก</button>
				<button type="submit" class="btn btn-primary">ลบเลย</button>
				</form>
			</div>
		</div>
	</div>
</div>





<div class="modal fade" id="Modallogout" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">คุณกรอกรหัสผ่านบ่ถูกเน้อ</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

					<form id="logout" action="logout" method="post">
				
		
			
					<div class="form-group">
						<label for="exampleInputEmail1">คุณกรอกรหัสผ่านบ่ถูกเน้อ?</label> 
					</div>
					
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">ok</button>
				</form>
			</div>
		</div>
	</div>
</div>



