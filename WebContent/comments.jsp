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
		<div class="collapse navbar-collapse pull-right"
			id="bs-example-navbar-collapse-1">
			<h:form>
				<form class="navbar-form navbar-left" role="search">
					<div>
						<h:commandButton action="#{userController.logoutUser}"
							type="submit" styleClass="btn btn-default" value="Logout" />
					</div>
				</form>
			</h:form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-10">
				<div class="jumbotron">
					<div class="page-header">
						<h1>Comments about 
						<h:form> 
							<h:commandLink
											action="#{projectController.getProjectForID}"
											value="#{commentController.comment.project.name}">
											<f:param name="id" value="#{commentController.comment.project.id}" />
										</h:commandLink>
										</h:form>
						</h1>
					</div>

					<table class="table table-striped">
						<thead>
							<tr>
								<th>User</th>
								<th>Comment</th>
							</tr>
						</thead>
						<tbody>
						<h:form>
							<c:forEach var="comment" items="#{commentController.comments}">
								<tr>
									<td><h:commandLink
											action="#{userController.getUserForID}"
											value="#{comment.user.name} #{comment.user.lastname}">
											<f:param name="id" value="#{comment.user.id}" />
										</h:commandLink></td>
									<td><h:outputText value="#{comment.description}">
										</h:outputText></td>
										
								</tr>
							</c:forEach>
							</h:form>
						</tbody>
					</table>
				</div>
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