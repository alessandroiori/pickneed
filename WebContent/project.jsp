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
<title>Project Details</title>

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

		
			<div class="row row-offcanvas row-offcanvas-right">
				<div class="col-xs-9 col-sm-6" align="center">
					<div class="panel panel-primary" align="center">
						<div class="panel-heading">
							<div>
								<c:if
									test="${projectController.project.userCreator.id == user.id}">
									<h:form>
										<h:commandLink value="Delete" styleClass="btn btn-default"
											action="#{projectController.removeProject}" />
									</h:form>
								</c:if>

								<div class="panel-title">Project Details:</div>
							</div>
						</div>
						<div class="panel-body">
							<table style="font-size: 19px;">
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Name:</td>
									<td>${projectController.project.name}</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Expiration Date:</td>
									<td><h:outputText
											value="#{projectController.project.expirationDate}">
											<f:convertDateTime dateStyle="short" type="date" />
										</h:outputText></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Place:</td>
									<td>${projectController.project.place}</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Description:</td>
									<td>${projectController.project.description}</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Creator:</td>
									<td><h:form>
											<h:commandLink action="#{userController.getUserForID}"
												value="#{projectController.project.userCreator.name}
												#{projectController.project.userCreator.lastname}">
												<f:param name="id"
													value="#{projectController.project.userCreator.id}" />
											</h:commandLink>
										</h:form></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Current Amount: &nbsp; &nbsp; &nbsp; &nbsp;</td>
									<td>${projectController.project.piggybank.currentAmount}</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>Edge:</td>
									<td>${projectController.project.piggybank.edge}</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
							<br>
							<div class="row">
								<div class="col-md-4">
									<h:form>
										<h:commandLink action="#{projectController.listProjects}"
											styleClass="btn btn-primary" value="Ongoing projects" />
									</h:form>
								</div>

								<div class="col-md-4">
									<h:form>
										<a class="btn btn-primary" role="button"
											href="<c:url value="/faces/makePayment.jsp"/>">Partecipate
											to project</a>
									</h:form>
								</div>

								<div class="col-md-4">
									<h:form>
										<h:commandLink action="#{projectController.listPartecipants}"
											styleClass="btn btn-primary"
											value="Show
									partecipants" />
									</h:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col-xs-9 col-sm-6">
					<div class="jumbotron">
						<div class="page-header">
							<h1>Comments</h1>
						</div>
						<div>&nbsp;</div>
						<h:form>
							<div><h:inputText styleClass="form-control"
								value="#{commentController.description}" /> </div>
							<div><h:commandButton action="#{commentController.createComment}"
								type="submit" styleClass="btn btn-primary btn-lg"
								value="comment" /></div>
						</h:form>
						<table class="table table-striped">
							<thead>
								<tr>
									<th><h2>User</h2></th>
									<th><h2>Comment</h2></th>
								</tr>
							</thead>
							<tbody style="width:10px">
								<h:form>
									<c:forEach var="comment" items="#{projectController.comments}">
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