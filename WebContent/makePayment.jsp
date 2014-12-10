<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<f:view>
	<html lang="en">
<head>
<c:if test="${user == null}">
	<meta http-equiv="refresh" content="0; url=faces/index.jsp" />
</c:if>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List projects</title>

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

	<nav class="navbar navbar-default navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header ">
			<a class="navbar-brand" href="<c:url value="/faces/home.jsp"/>">Home</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse pull-right">
			<h:form>
				<h:commandLink action="#{userController.getUserForID}"
					value="#{user.name} #{user.lastname}" style="color:white">
					<f:param name="id" value="#{user.id}" />
				</h:commandLink>
			</h:form>

			<h:form>

				<h:commandLink action="#{userController.logoutUser}"
					styleClass="btn btn-default" value="Logout" />


			</h:form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>


	<div class="container">
		<div class="row">
			<div class="col-lg-12" align="center">
				<font size="40px" style="color: #31708F"><b>Make Payment</b></font>
				<div class="alert alert-info" align="center">
					<div>
						<h2>Insert partecipation money</h2>
					</div>
					<div>&nbsp;</div>
					<h:form>
					<div>
						<h:inputText value="#{paymentController.money}" required="true"
							id="money" requiredMessage="Payment is mandatory to partecipate"
							converterMessage="Insert a valid payment" />
						<h:message for="money" style="color:red" />
					</div>
					<div>&nbsp;</div>
					<div>
						<h:commandButton value="Partecipate"
							action="#{paymentController.createPayment}"
							styleClass="btn btn-primary" />
					</div>
					</h:form>
				</div>
			</div>
		</div>
	</div>
</body>
	</html>
</f:view>