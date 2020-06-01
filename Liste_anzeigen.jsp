<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>

<h2> Liste aller Mitarbeiter oder Kunden</h2>
<c:if test ="${param.Auswahl eq 'Kunde' }">
<table class ="table table-striped table-responsive text-center">
    <thead class ="thead-light">
        <tr>
            <th scope ="col"> Kundennummer</th>
            <th scope ="col"> Vorname</th>
            <th scope ="col"> Nachname</th>
        </tr>
    </thead>
<tbody>
<sql:query var="Kunden"
           sql="select Kundennummer, Vorname ,Nachname from Kunde join Person on Kunde.SVN = Person.SVN order by Kundennummer" >
</sql:query>

<c:forEach var="Kunden" varStatus="status" begin = "0" items="${Kunden.rows}">
 <tr>
     <td>${Kunden.Kundennummer}</td>
     <td>${Kunden.Vorname}</td>
     <td>${Kunden.Nachname}</td>
 </tr>
</c:forEach>
</tbody>
</table>
    </c:if>

<c:if test ="${param.Auswahl eq 'Angestellter' }">
    <table class ="table table-striped table-responsive text-center">
        <thead class ="thead-light">
        <tr>
            <th scope ="col"> Angestelltennummer</th>
            <th scope ="col"> Vorname</th>
            <th scope ="col"> Nachname</th>
        </tr>
        </thead>
        <tbody>
        <sql:query var="Angst"
                   sql="select Angestelltennummer, Vorname ,Nachname from Angestellter join Person on Angestellter.SVN = Person.SVN order by Angestelltennummer" >
        </sql:query>

        <c:forEach var="Angst" varStatus="status" begin = "0" items="${Angst.rows}">
            <tr>
                <td>${Angst.Angestelltennummer}</td>
                <td>${Angst.Vorname}</td>
                <td>${Angst.Nachname}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>


<p>${param.Auswahl}</p>