<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>

<form method="post" action="Time.jsp">
    <select name="masseur" size="1">
        <sql:query var="test"
                   sql="select Vorname,Nachname, Lizenznummer from Masseur, Person, Angestellter, Massagetyp
                         where Person.SVN = Angestellter.SVN and Masseur.Angestelltennummer = Angestellter.Angestelltennummer and Massagetyp.Beschreibung = Masseur.Qualifikation and Massagetyp.Identifikation = ?" >
            <sql:param value="${param.Identifikation}" />
        </sql:query>

        <c:forEach var="tests" begin="0" items="${test.rows}">
            <option value="${tests.Lizenznummer}">${tests.Vorname} ${tests.Nachname}</option>
        </c:forEach>
    </select>
    <input type="hidden" name="Date" value="${param.Date}"/>
    <input type="hidden" name="Kundennummer" value="${param.Kundennummer}"/>
    <input type="hidden" name="Identifikation" value="${param.Identifikation}"/>
    <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-ok"></span> Ausw&auml;hlen
    </button>
</form>
<p>Identifikation:${param.Identifikation}    Kundennummer:${param.Kundennummer}    Date:${param.Date}  ${tests.Vorname} </p>