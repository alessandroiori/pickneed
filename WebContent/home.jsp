<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<c:if test="${user == null}">
	<meta http-equiv="refresh" content="0; url=faces/index.jsp" />
</c:if>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Pickneed</title>

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
	<f:view>

		<nav class="navbar navbar-default navbar-inverse" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header ">
				<a class="navbar-brand" href="#">Home</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse pull-right">
				<div class="form-group">
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

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>


		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jumbotron">
						<p>
							<a class="btn btn-primary btn-lg pull-right" role="button"
								href="<c:url value="/faces/createNewProject.jsp"/>">Create
								new project</a>
						</p>
						<h1>Welcome in Pickneed</h1>
						<h1>${user.name} ${user.lastname}</h1>
						<p>email: ${user.email}</p>
						<br>



						<div class="row">
							<div class="col-md-4">
								<h:form>
									<h:commandLink action="#{projectController.createdProjectsBy}"
										styleClass="btn btn-primary"
										value="Show your created Projects" />
								</h:form>
							</div>

							<div class="col-md-4">
								<h:form>
									<h:commandLink action="#{projectController.ongoingProjects}"
										styleClass="btn btn-primary"
										value="Show your ongoing Projects" />
								</h:form>
							</div>

							<div class="col-md-4">
								<h:form>
									<h:commandLink action="#{projectController.listProjects}"
										styleClass="btn btn-primary" value="List all projects" />
								</h:form>
							</div>
						</div>
					</div>
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
