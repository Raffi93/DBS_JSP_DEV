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
    <h2>Bitte w&auml;hlen Sie den Kunden f&uuml;r welchen gebucht werden soll.</h2>
    <form method="post" action="index.jsp">
        <input type="hidden" name="menu" value="massage"/>

        <select name="spezi" size="1">
            <sql:query var="kunden"
                       sql="select Vorname,Nachname, Kundennummer from Kunde, Person
                             where Person.SVN = Kunde.SVN " >
            </sql:query>

            <c:forEach var="kunde" begin="0" items="${kunden.rows}">
                <option value="${kunde.Kundennummer}">${kunde.Vorname} ${kunde.Nachname}</option>
            </c:forEach>
        </select>
        <input type="date" data-date="" data-date-format="yyyy/mm/dd" name="DATUM" value="${param.DATUM}" required>
        <button type="submit">
            Ausw&auml;hlen
        </button>
    </form>
</div>
