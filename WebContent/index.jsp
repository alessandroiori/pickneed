<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE html >

<html lang="en">
<head>
<meta charset="utf-8">
<meta charset="US-ASCII">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Pickneed</title>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<script language="Javascript">
		function capLock(e) {
			kc = e.keyCode ? e.keyCode : e.which;
			sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
			if (((kc >= 65 && kc <= 90) && !sk)
					|| ((kc >= 97 && kc <= 122) && sk))
				document.getElementById('divCaps').style.visibility = 'visible';
			else
				document.getElementById('divCaps').style.visibility = 'hidden';
		}
	</script>

	<f:view>
		<nav class="navbar navbar-default navbar-inverse" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header ">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Pickneed</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse pull-right">
					<form class="navbar-form navbar-left" role="form">
						<table>
							<h:form>
								<tr>
									<td><font color="red"> ${userController.loginError}
											&nbsp;&nbsp;</font></td>
									<td><font color="white">Email &nbsp;&nbsp;&nbsp; </font></td>
									<td><h:inputText styleClass="form-control"
											value="#{userController.email}" /></td>
									<td><font color="white">&nbsp;&nbsp;&nbsp; Password
											&nbsp;&nbsp;&nbsp;</font></td>
									<td><h:inputSecret styleClass="form-control"
											value="#{userController.password}"
											onkeypress="capLock(event)" /></td>
									<td>&nbsp;</td>
									<td><h:commandButton action="#{userController.loginUser}"
											type="submit" styleClass="btn btn-default" value="Login" /></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><div id="divCaps" style="visibility: hidden">
											<font color="white">Caps Lock is on.</font>
										</div></td>
									<td></td>
								</tr>
							</h:form>
						</table>
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<table>
						<tr>
							<td>
								<div class="jumbotron">
									<h1>Pickneed</h1>
									<br>
									<p>Organise your events in a simple way and share them with
										your friends</p>
									<br> <br> <br> <br> <br> <br>
								</div>
							</td>

							<td>&nbsp; &nbsp; &nbsp; &nbsp;</td>

							<td>
								<div class="jumbotron">

									<p>Enter in Pickneed</p>
									<p>
										<font color="red"> ${userController.signupError} </font>
									</p>
									<h:form>
										<table style="font-size: 16px;">

											<tr>
												<td>Name:</td>
												<td><h:inputText styleClass="form-control"
														value="#{userController.name}" required="true"
														requiredMessage="Name is mandatory" id="name" /></td>
											</tr>

											<tr>
												<td>&nbsp;</td>
												<td><h:message for="name" style="color:red" /></td>
											</tr>

											<tr>
												<td>Lastname: &nbsp; &nbsp;</td>
												<td><h:inputText styleClass="form-control"
														value="#{userController.lastname}" required="true"
														requiredMessage="Lastname is mandatory" id="lastname" /></td>
											</tr>

											<tr>
												<td>&nbsp;</td>
												<td><h:message for="lastname" style="color:red" /></td>
											</tr>

											<tr>
												<td>Email:</td>
												<td><h:inputText styleClass="form-control"
														value="#{userController.email}" required="true"
														requiredMessage="Email is mandatory"
														validatorMessage="Is not valid (es. prova@email.com)"
														id="email">
														<f:validateRegex
															pattern="[\w\.-]*[a-zA-Z0-9_]@[\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]" />
													</h:inputText></td>
											</tr>

											<tr>
												<td>&nbsp;</td>
												<td><h:message for="email" style="color:red" /></td>
											</tr>

											<tr>
												<td>Password:</td>
												<td><h:inputSecret styleClass="form-control"
														value="#{userController.password}" required="true"
														requiredMessage="Password is mandatory" id="password"
														onkeypress="capLock(event)" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td><h:message for="password" style="color:red" /></td>
											</tr>
										</table>
										<br>
										<br>
										<div id="divCaps" style="visibility: hidden">
											<font color="red">Caps Lock is on.</font>
										</div>
										<p>
											<h:commandButton action="#{userController.createUser}"
												type="submit" styleClass="btn btn-primary btn-lg"
												value="Sign up »" />

										</p>
									</h:form>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
	</f:view>
</body>
</html>

