<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<f:view>
	<html lang="en">
<head>
<c:if test="${user == null}"><meta http-equiv="refresh" content="0; url=faces/index.jsp" /></c:if>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create new project</title>

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
			<div>
			<h:form><h:commandLink action="#{userController.getUserForID}" value="#{user.name} #{user.lastname}" style="color:white">
				<f:param name="id" value="#{user.id}"/>
			</h:commandLink></h:form>
			<h:form>	
					<h:commandLink action="#{userController.logoutUser}"
						 styleClass="btn btn-default" value="Logout" />	
			</h:form>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="col-lg-12">
		<div class="container jumbotron">
			<div align="center">
				<h1>Create new project</h1>
				<h:form>
					<table style="font-size: 20px;">

						<tr>
							<td>Name:</td>
							<td><h:inputText styleClass="form-control"
									value="#{projectController.name}" required="true"
									requiredMessage="Name is mandatory" id="name" />
									<h:message for="name" style="color:red" /></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>ExpirationDate:</td>
							<td><h:inputText styleClass="form-control"
									value="#{projectController.expirationDate}" required="true"
									requiredMessage="Expiration Date is mandatory"
									converterMessage="Invalid Date (ex. 11-7-2014)"
									id="expirationDate">
									<f:convertDateTime pattern="d-M-yyyy" />
								</h:inputText>
								<h:message for="expirationDate" style="color:red" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Place:</td>
							<td><h:inputText styleClass="form-control"
									value="#{projectController.place}" required="true"
									requiredMessage="Place is mandatory" id="place" />
									<h:message for="email" style="color:red" /></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Edge:</td>
							<td><h:inputText styleClass="form-control"
									value="#{projectController.edge}" required="true"
									requiredMessage="Edge is mandatory"
									converterMessage="Edge is a number" id="edge" />
									<h:message for="edge" style="color:red" /></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Description:</td>
							<td><h:inputTextarea styleClass="form-control"
									value="#{projectController.description}" required="false"
									cols="20" rows="5" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>

					<h:commandButton action="#{projectController.createProject}"
						type="submit" styleClass="btn btn-primary btn-lg" value="Create" />
				</h:form>
			</div>
		</div>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
	</html>
</f:view>