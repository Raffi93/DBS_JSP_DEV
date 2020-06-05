<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>

<h2> Liste aller Mitarbeiter oder Kunden</h2>


<form method="post" action="Liste_anzeigen.jsp">
    <input type="hidden" name="menu" value="Liste_anzeigen.jsp" />
    <input type="hidden" name="Auswahl" value="Kunde" />

    Ergebnisse f&uuml;r

    <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-search"></span> Kunden
    </button>
</form>

<form method="post" action="Liste_anzeigen.jsp">
    <input type="hidden" name="menu" value="Liste_anzeigen.jsp" />
    <input type="hidden" name="Auswahl" value="Angestellter" />

    Ergebnisse f&uuml;r
<button type="submit" class="btn btn-primary">
    <span class="glyphicon glyphicon-search"></span> Mitarbeiter
</button>
</form>