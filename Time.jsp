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
        <th/>
    </tr>
    </thead>
    <tbody>
<fmt:parseDate value="${fn:replace(param.Date, '-', '/')}" var="parsedDate" pattern="yyyy/MM/dd" />

<sql:query var="massagen"
           sql="select  Massage.Uhrzeit, Massage.Raumkodierung, Massage.Identifikation, Beschreibung from Massage
                    join Massagetyp on Massage.Identifikation = Massagetyp.Identifikation
                   left join Vormerkung on Massage.Uhrzeit = Vormerkung.Uhrzeit and Massage.Raumkodierung = Vormerkung.Raumkodierung and Massage.Identifikation = Vormerkung.Identifikation
                   where Massage.Identifikation = ? and not exists(select * from Vormerkung where Vormerkung.Uhrzeit= Massage.Uhrzeit  and Vormerkung.Datum = ?
                and( (Vormerkung.Kundennummer=?) or (Vormerkung.Lizenznummer = ?) or (Vormerkung.Raumkodierung=Massage.Raumkodierung)))">
    <sql:param value="${param.Identifikation}" />
    <sql:dateParam value="${parsedDate}" type="DATE" />
    <sql:param value="${param.Kundennummer}" />
    <sql:param value="${param.masseur}" />
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
                <td> <button >Buchen</button></td>
            </tr>
        </form>
    </c:forEach>
    </tbody>
</table>

<p>Identifikation:${param.Identifikation}    Kundennummer:${param.Kundennummer}    Date:${param.Date}  linzenz: ${param.masseur}</p>