<!doctype html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
	<meta name="description" content="">
	<meta name="author" content="Raffael Baar, Simon Schlicker, Erik Schaffer, Markus Serloth">

	<title>Massage</title>

	<!-- Bootstrap core CSS -->
	<!--<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-datepicker.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

	<!-- Custom styles for this template -->
	<!--<link href="css/uni.css" rel="stylesheet">-->
	<link href="css/massage.css" rel="stylesheet">
</head>

<body>
<div class="cover-container d-flex align-items-center h-100 p-5 mx-auto flex-column">
	<header class="masthead"><!-- mb-auto -->
		<div class="inner">
			<h3 class="masthead-brand">Massage Studio zur heilenden Hand</h3>
			<img class="rounded float-right img-responsive masthead-img" src="images/logo.jpg" alt="logo" title="logo" height="60" style="margin-left: 2rem"/>

			<nav class="nav navbar-static-top nav-masthead justify-content-center">
				<a class="nav-link ${empty param.menu ? 'active' : ''}" href="index.jsp" id="startmenu">Startseite</a>

				<!-- massage buchen-->
				<a class="nav-link ${empty param.menu=='buchen' ? 'active' : ''}" href="index.jsp?menu=buchen" id="buchungsmenu">Massage buchen</a>

				<!-- B?cherliste ausgeliehen-->
				<a class="nav-link ${empty param.menu=='buch_ausleihen' ? 'active' : ''}" href="index.jsp?menu=ausgeliehene_buecher" id="bookmenu">Ausleihe</a>

				<!-- Masseurliste -->
				<a class="nav-link ${empty param.menu=='masseure' ? 'active' : ''}" href="index.jsp?menu=masseure" id="masseurmenu">Masseure</a>

				<!-- Auflistung Angestellte Kunden Vormerkung-->
				<a class="nav-link ${empty param.menu=='liste' ? 'active' : ''}" href="index.jsp?menu=Liste" id="listemenu">Auflistung</a>

				<!-- Kunden oder Angestellte erfassen-->
				<div class="dropdown">
					<a  ${param.menu=='Angestellter_erfassen' or param.menu=='Kunde_erfassen' ? 'active' : ''}" href="#" id="erfassenmenu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Erfassen
					</a>
					<div class="dropdown-content" aria-labelledby="erfassenmenu">
						<a  href="index.jsp?menu=Angestellter_erfassen">Angestellter erfassen</a>
						<a  href="index.jsp?menu=Kunde_erfassen">Kunde erfassen</a>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<main role="main" class="inner cover">
		<c:if test="${!empty param.menu}">
			<jsp:include page="${param.menu}.jsp" />
		</c:if>
		<c:if test="${empty param.menu}">
			<jsp:include page="init.jsp" />
		</c:if>
	</main>

	<footer class="mastfoot mt-auto text-center">
		<div class="inner">
			<p><a href="mailto:wbt@dedisys.org" class="nav-link">
				Kontaktieren Sie uns:
				<img class="rounded img-responsive mastfoot-img" src="images/email.jpg" alt="contact us" title="contact us" />
			</a>
			</p>
		</div>
	</footer>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-3.3.1.slim.min.js"><\/script>')</script>
<script src="js/vendor/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datepicker.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
