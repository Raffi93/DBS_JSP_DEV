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

<h2>Bitte w&auml;hlen sie einen Massageblock aus!</h2>
<form method="post" action="index.jsp">
<input type="hidden" name="menu" value="vormerkung_save"/>

<table>
    <thead>
    <tr>
        <th scope ="col"> Uhrzeit</th>
        <th scope ="col"> Raum</th>
        <th scope ="col"> Massageart</th>
        <th scope ="col"> Massageart</th>
    </tr>
    </thead>
    <tbody>
    <sql:query var="massagen"
               sql="select distinct Uhrzeit, Raumkodierung, Massage.Identifikation, Beschreibung from Massage join Massagetyp on Massage.Identifikation = Massagetyp.Identifikation where Massage.Identifikation = ?" >
        <sql:param value="${param.Identifikation}" />

    </sql:query>


    <c:forEach var="massage" varStatus="status" begin = "0" items="${massagen.rows}">


            <input type="hidden" name="Date" value="${param.Date}"/>
            <input type="hidden" name="Kundennummer" value="${param.Kundennummer}"/>
            <input type="hidden" name="Identifikation" value="${param.Identifikation}"/>
            <input type="hidden" name="Lizenznummer" value="${param.masseur}"/>
            <input type="hidden" name="Uhrzeit" value="${massage.Uhrzeit}"/>
            <input type="hidden" name="Raumkodierung" value="${massage.Raumkodierung}"/>
            <tr>
                <td>${massage.Uhrzeit}</td>
                <td>${massage.Raumkodierung}</td>
                <td>${massage.Beschreibung}</td>
                <td>${massage.Identifikation}</td>
                <td> <button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search"></span> Buchen
                </button></td>
            </tr>
        </form>
    </c:forEach>
    </tbody>
</table>

<p>Identifikation:${param.Identifikation}    Kundennummer:${param.Kundennummer}    Date:${param.Date}  linzenz: ${param.masseur}</p>