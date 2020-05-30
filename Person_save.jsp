<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        var="myDB"
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>


<form method="post" action="Person.jsp">
<sql:query dataSource="${myDB}" var="sozversid">
    SELECT * from Person where SVN = ${param.SVN}
</sql:query>

<c:if test="${sozversid.rowCount le 0}">
    <sql:update dataSource="${myDB}" var="result">
        INSERT INTO Person (SVN, Nachname, Vorname, Adresse, Geburtsdatum) VALUES (?, ?, ?, ?, ?)
        <sql:param value="${param.SVN}" />
        <sql:param value="${param.NACHNAME}" />
        <sql:param value="${param.VORNAME}" />
        <sql:param value="${param.ADRESSE}" />
        <sql:param value="${param.GEBURTSDATUM}" />
    </sql:update>
</c:if>

    <div>
        <input type="hidden" name="menu" value="person" />

        <table width="600">

            <tr>
                <td>Vorname</td>
                <td>${param.VORNAME}</td>
            </tr>
            <tr>
                <td>Nachname</td>
                <td>${param.NACHNAME}</td>
            </tr>
            <tr>
                <td>Adresse</td>
                <td>${param.ADRESSE}</td>
            </tr>
            <tr>
                <td>Date</td>
                <td>${param.GEBURTSDATUM}</td>
            </tr>
            <tr>
                <td>SVN</td>
                <td>${param.SVN}</td>
            </tr>
            <tr>
                <td>Ergebnis:</td>
                <td>
                    <c:if test="${result>=1}">
                        <font color='green'>OK</font>
                    </c:if>
                    <c:if test="${sozversid.rowCount gt 0}">
                        <font color='red'>Sozialversicherungsnummer bereits vergeben</font>
                        <input type="hidden" name="VORNAME" value="${param.VORNAME}" >
                        <input type="hidden" name="NACHNAME" value="${param.NACHNAME}" >
                        <input type="hidden" name="ADRESSE" value="${param.ADRESSE}" >
                        <input type="hidden" name="DATE" value="${param.GEBURTSDATUM}" >
                        <input type="hidden" name="SVN" value="${param.SVN}" >
                    </c:if>
                </td>
            </tr>
        </table>

        <input type="submit" value="OK" />
    </div>
</form>

