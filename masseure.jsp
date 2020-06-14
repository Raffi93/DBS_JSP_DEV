<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>

<div style="text-align:center; width: 100%;">
    <h2>Liste aller Masseure</h2>

    <p> Bitte w&auml;hlen Sie einen Masseur aus um mehr Details zu bekommen:</p>

    <form method="post" action="index.jsp">
        <input type="hidden" name="menu" value="masseur_details" />

        Masseur:
        <select name="spezi" size="1">
            <sql:query var="masseure"
                       sql="select Vorname, Nachname ,Lizenznummer from Masseur, Person, Angestellter
                             where Person.SVN = Angestellter.SVN and Angestellter.Angestelltennummer= Masseur.Angestelltennummer" >
            </sql:query>

            <c:forEach var="masseur" begin="0" items="${masseure.rows}">
                <option value="${masseur.Lizenznummer}">${masseur.Vorname} ${masseur.Nachname}</option>
            </c:forEach>
        </select>

        <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-search"></span> Anzeigen...
        </button>
    </form>
</div>