<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

<sql:setDataSource
        var="myDB"
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>

<fmt:parseDate value="${fn:replace(param.GEBURTSDATUM, '-', '/')}" var="parsedDateOfBirth" pattern="yyyy/MM/dd" />


    <sql:query dataSource="${myDB}" var="sozversid">
        SELECT * from Person where SVN = ${param.SVN}
    </sql:query>

    <sql:query dataSource="${myDB}" var="lizenznr">
        SELECT * from Person where SVN = ${param.Lizenznummer}
    </sql:query>

    <c:if test="${sozversid.rowCount le 0 and lizenznr.rowCount le 0 or sozversid.rowCount le 0 and param.test == 2}">
        <sql:update dataSource="${myDB}" var="result">
            INSERT INTO Person (SVN, Nachname, Vorname, Adresse, Geburtsdatum) VALUES (?, ?, ?, ?, ?)
            <sql:param value="${param.SVN}" />
            <sql:param value="${param.NACHNAME}" />
            <sql:param value="${param.VORNAME}" />
            <sql:param value="${param.ADRESSE}" />
            <sql:dateParam value="${parsedDateOfBirth}" type="DATE" />
        </sql:update>

        <c:if test ="${param.test == 1}">

            <sql:update dataSource="${myDB}" var="result">
                INSERT INTO Angestellter (SVN, BLZ, Angestelltennummer,Kontonummer) VALUES (?, ?, (SELECT MAX(Angestelltennummer) + 1 from Angestellter),?)
                <sql:param value="${param.SVN}" />
                <sql:param value="${param.BLZ}" />
                <sql:param value="${param.Kontonummer}" />
            </sql:update>



            <sql:update dataSource="${myDB}" var="result">
                INSERT INTO Masseur (LIZENZNUMMER, ANGESTELLTENNUMMER, QUALIFIKATION,AUSBILDUNGSZEIT) VALUES (?, (SELECT MAX(Angestelltennummer) from Angestellter),?,?)
                <sql:param value="${param.Lizenznummer}" />
                <sql:param value="${param.spezi}" />
                <sql:param value="${param.Ausbildungszeit}" />
            </sql:update>
        </c:if>

        <c:if test ="${param.test == 2}">
            <sql:update dataSource="${myDB}" var="result">
                INSERT INTO Kunde (SVN, Kundennummer) VALUES (?, (SELECT MAX(Kundennummer) + 1 from Kunde))
                <sql:param value="${param.SVN}" />
            </sql:update>
        </c:if>
    </c:if>


    <div>
        <input type="hidden" name="menu" value="person" />

        <table width="600">

            <tr>
                <td>SVN</td>
                <td>${param.SVN}</td>
            </tr>
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
            <c:if test ="${param.test == 1}">
            <sql:query dataSource="${myDB}" var="Angestellte"
                       sql="select max(Angestelltennummer) as test from Angestellter" >
            </sql:query>
            <tr>
                <td>Angestelltennummer</td>
                <c:forEach var="Angestellter" begin="0" items="${Angestellte.rows}">
                <td >${Angestellter.test}</td>
                </c:forEach>
            <tr>
                <td>Lizenznummer</td>
                <td>${param.Lizenznummer}</td>
            </tr>
            <tr>
                <td>Qualifikation</td>
                <td>${param.spezi}</td>
            </tr>
            </c:if>
            <c:if test ="${param.test == 2}">
            <sql:query dataSource="${myDB}" var="Kunden"
                       sql="select max(Kundennummer) as test from Kunde" >
            </sql:query>
                <tr>
                <td>Kundennummer</td>
                    <c:forEach var="kunde" begin="0" items="${Kunden.rows}">
                    <td >${kunde.test}</td>
                </c:forEach>
                </tr>
            </c:if>
            <tr>
                <td>Ergebnis:</td>
                <td>
                    <c:if test="${result>=1}">
                        <font color='green'>Gespeichert</font>
                    </c:if>
                    <c:if test="${lizenznr.rowCount gt 0}">
                        <font color='red'>Lizenznummer bereits vergeben</font>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>


