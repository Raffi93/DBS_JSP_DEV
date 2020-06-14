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


<div>
    <input type="hidden" name="menu" value="person" />

    <table width="600">

        <tr>
            <td>Datum</td>
            <td>${param.Date}</td>
        </tr>
        <tr>
            <td>Uhrzeit</td>
            <td>${param.Uhrzeit}</td>
        </tr>
        <tr>
            <td>Masseur</td>
            <td>${param.ADRESSE}</td>
        </tr>
        <tr>
            <td>Kundenname</td>
            <td>${param.GEBURTSDATUM}</td>
        </tr>
        <tr>
            <td>Raumnummer</td>
            <td>${param.SVN}</td>
        </tr>
        <tr>
            <td>Massagetyp</td>
            <td>${param.SVN}</td>
        </tr>
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
</form>