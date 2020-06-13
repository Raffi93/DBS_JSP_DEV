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

<h2>Bitte w&auml;hlen sie einen Massagetyp aus !</h2>



<table>
    <thead>
    <tr>
        <th scope ="col"> Beschreibung</th>
        <th scope ="col"> Kosten</th>
        <th scope ="col"> </th>
    </tr>
    </thead>
    <tbody>
    <sql:query var="massagen"
               sql="select Beschreibung, Kosten, Identifikation from Massagetyp" >
    </sql:query>


    <c:forEach var="massage" varStatus="status" begin = "0" items="${massagen.rows}">
        <form method="post" action="index.jsp">
            <input type="hidden" name="menu" value="vormerkung"/>

            <input type="hidden" name="Date" value="${param.DATUM}"/>
            <input type="hidden" name="Kundennummer" value="${param.spezi}"/>
            <input type="hidden" name="Identifikation" value="${massage.Identifikation}"/>
            <tr>
                <td>${massage.Beschreibung}</td>
                <td>${massage.Kosten}</td>
                <td> <button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search"></span> Buchen
                </button></td>
            </tr>
        </form>
    </c:forEach>
    </tbody>
</table>
<p>${parsedDate}     blub  ${param.DATUM}   </p>



