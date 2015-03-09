<!DOCTYPE html>
<html>
<head>
<title>Online Payment System</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<style type="text/css">
.bs-example {
	padding-left: 30px;
	padding-right: 30px;
}

label {
	font-weight: normal !important;
}
</style>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script>
	var userLoggedIn = false;
	$(document).ready(function() {
		$("#logincontainer").hide();
		if (userLoggedIn == false) {
			$("#paymentmenu").hide();
			$("#accountmenu").hide();
			$("#logutmenu").hide();
		} else {
			$("#paymentmenu").show();
			$("#accountmenu").show();
			$("#logutmenu").show();
			$("#signupmenu").hide();
			$("#loginmenu").hide();
		}

	});
	

	function loginClick() {
		$("#logincontainer").show();
		$("#logincontainer").dialog({
		    width: 'auto', 
		    maxWidth: 300,
		    height: 'auto',
		    fluid: true
		});
	}
	
	function login(){
		$.post("/payment/app/login",
			    {
			        username: $("#login-username").val(),
			        password: $("#login-password").val()
			    },
			    function(data, status){
			       window.location = "http://localhost:8080/payment/app/home";
			    });

	}
</script>

</head>
<body>
	
	<%@include file="header.jsp" %>
	
	<div style="clear: both"></div>

	<div class="container" id="logincontainer">
		<div id="loginbox"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
					<div
						style="float: right; font-size: 80%; position: relative; top: -10px">
						<a href="#">Forgot password?</a>
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

					<form id="loginform" class="form-horizontal" role="form">

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="login-username"
								type="text" class="form-control" name="username" value=""
								placeholder="username or email">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="login-password"
								type="password" class="form-control" name="password"
								placeholder="password">
						</div>

						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="remember" value="1"> Remember me
								</label>
							</div>
						</div>

						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="col-sm-12 controls">
								<a id="btn-login" class="btn btn-success"
									href="javascript:login()">Login </a>
								<!--  <a
								id="btn-fblogin" href="#" class="btn btn-primary">Login with
								Facebook</a> -->

							</div>
						</div>

						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href=""
										ng-click="loginCtrl.showRegister()"> Sign Up Here </a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
