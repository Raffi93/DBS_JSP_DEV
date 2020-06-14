<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sql:setDataSource
        var="myDB"
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>
<fmt:parseDate value="${fn:replace(param.Date, '-', '/')}" var="parsedDate" pattern="yyyy/MM/dd" />

<sql:update dataSource="${myDB}" var="result">
    INSERT INTO Vormerkung (Datum, Kundennummer, Lizenznummer, Uhrzeit, Raumkodierung, Identifikation) VALUES (?, ?, ?, ?, ?, ?)
    <sql:dateParam value="${parsedDate}" type="DATE" />
    <sql:param value="${param.Kundennummer}" />
    <sql:param value="${param.Lizenznummer}" />
    <sql:param value="${param.Uhrzeit}" />
    <sql:param value="${param.Raumkodierung}" />
    <sql:param value="${param.Identifikation}" />
</sql:update>

<sql:query dataSource="${myDB}" var="Naming"
           sql="select y.Vorname as KVorname,y.Nachname as KNachname, x.Nachname as MNachname , x.Vorname as MVorname, TO_CHAR(Datum, 'DD.MM.YYYY') AS DatumPretty, Massagetyp.Beschreibung as BMassage from Vormerkung join Kunde on Kunde.Kundennummer = Vormerkung.Kundennummer
                        join Person y on Kunde.SVN= y.SVN
                        join Masseur on Vormerkung.Lizenznummer = Masseur.Lizenznummer
                        join Angestellter on Angestellter.Angestelltennummer = Masseur.Angestelltennummer
                        join Person x on Angestellter.SVN = x.SVN
                        join Massagetyp on Massagetyp.Identifikation = Vormerkung.Identifikation
                        where Vormerkung.Datum = ? and Vormerkung.Kundennummer = ? and Vormerkung.Lizenznummer = ? and Vormerkung.Uhrzeit = ? and Vormerkung.Raumkodierung = ? and Vormerkung.Identifikation = ?">
    <sql:dateParam value="${parsedDate}" type="DATE" />
    <sql:param value="${param.Kundennummer}" />
    <sql:param value="${param.Lizenznummer}" />
    <sql:param value="${param.Uhrzeit}" />
    <sql:param value="${param.Raumkodierung}" />
    <sql:param value="${param.Identifikation}" />
</sql:query>


<div>
    <input type="hidden" name="menu" value="person" />

    <table width="600">
        <c:forEach var="Name" varStatus="status" begin = "0" items="${Naming.rows}">
            <tr>
                <td>Datum</td>
                <td>${Name.DatumPretty}</td>
            </tr>
            <tr>
                <td>Uhrzeit</td>
                <td>${param.Uhrzeit}</td>
            </tr>

            <tr>
                <td>Masseur</td>
                <td>${Name.MVorname} ${Name.MNachname}</td>
            </tr>
            <tr>
                <td>Kundenname</td>
                <td>${Name.KVorname} ${Name.KNachname}</td>
            </tr>

            <tr>
                <td>Raumnummer</td>
                <td>${param.Raumkodierung}</td>
            </tr>
            <tr>
                <td>Massagetyp</td>
                <td>${Name.BMassage}</td>
            </tr>
        </c:forEach>
        <tr>
            <td>Ergebnis:</td>
            <td>
                <c:if test="${result>=1}">
                    <font color='green'>Gespeichert</font>
                </c:if>
            </td>
        </tr>
    </table>
</div>
