<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>

<h2>Der Masseur ist auf jene Koerperbereiche spezialisiert: </h2>

<c:if test="${empty param.spezi}">
    Es wurde kein Masseur ausgew&auml;hlt!
</c:if>

<c:if test="${!empty param.spezi}">
        <sql:query var="masseure"
           sql="select Vorname, Nachname, Qualifikation
	  		from Masseur, Person, Angestellter
		  	where Angestellter.Angestelltennummer = Masseur.Angestelltennummer and Person.SVN = Angestellter.SVN and Vorname = ?" >
              <sql:param value="${param.spezi}" />
        </sql:query>

        <c:forEach var="masseur" begin="0" items="${masseure.rows}">
             <p>Spezialisierung des Masseurs <b>${masseur.Vorname} ${masseur.Nachname}</b>:
             <b>${masseur.Qualifikation}</b>.</p>



    </c:forEach>
</c:if>

<br /><a href="index.jsp?menu=masseure">Zur&uuml;ck zur Auswahl</a>