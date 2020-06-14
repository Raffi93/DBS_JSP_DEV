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


	<link href="css/massage.css" rel="stylesheet">
</head>

<body>
<div >
	<header>
		<div>
			<div>
				<h1 style="margin: 1rem 4rem;vertical-align:middle;">Massage Studio zur heilenden Hand <img  src="images/logo.jpg" alt="logo" title="logo" height="90" style="vertical-align:middle;"/></h1>
			</div>
			<ul class="nav">
				<li><a  href="index.jsp" id="startmenu">Startseite</a></li>

				<!-- massage buchen-->
				<li><a  href="index.jsp?menu=buchen" id="buchungsmenu">Massage buchen</a></li>

				<!-- B?cherliste ausgeliehen-->
				<li><a  href="index.jsp?menu=ausgeliehene_buecher" id="bookmenu">Ausleihe</a></li>

				<!-- Masseurliste -->
				<li><a href="index.jsp?menu=masseure" id="masseurmenu">Masseure</a></li>

				<!-- Auflistung Angestellte Kunden Vormerkung-->
				<li><a  href="index.jsp?menu=Liste" id="listemenu">Auflistung</a></li>

				<!-- Kunden oder Angestellte erfassen-->
				<div class="dropdown">
					<li><a href="#">Erfassen</a></li>
					<div class="dropdown-content" >
						<li><a  href="index.jsp?menu=Angestellter_erfassen">Masseur erfassen</a></li>
						<li><a  href="index.jsp?menu=Kunde_erfassen">Kunde erfassen</a></li>
					</div>
				</div>
			</ul>
		</div>
	</header>
	<main>
		<c:if test="${!empty param.menu}">
			<jsp:include page="${param.menu}.jsp" />
		</c:if>
		<c:if test="${empty param.menu}">
			<jsp:include page="init.jsp" />
		</c:if>
	</main>

	<footer class="footer">
		<div>
			<p><a href="#">
				Kontaktieren Sie uns:
				<img class="kontakt" style="vertical-align:middle;" src="images/email.jpg" title="contact us" />
			</a>
			</p>
		</div>
	</footer>
</div>
</body>
</html>
