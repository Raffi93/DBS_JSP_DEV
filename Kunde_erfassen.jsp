<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>


<div style="text-align: center; width: 100%;"><h2>Kunde erfassen</h2></div>

<form method="post" action="index.jsp">
    <div>
        <input type="hidden" name="menu" value="Angestellter_save"/>
        <input type="hidden" name="test" value="2" />

        <table class="table-in">

            <tr>
                <td>SVN</td>
                <td><input type="number" name="SVN" max="9999999999" value="${param.SVN}" required></td>
            </tr>
            <tr>
                <td>Nachname</td>
                <td><input type="text" name="NACHNAME" maxlength="80" value="${param.NACHNAME}" required></td>
            </tr>
            <tr>
                <td>Vorname</td>
                <td><input type="text" name="VORNAME" maxlength="80" value="${param.VORNAME}" required></td>
            </tr>
            <tr>
                <td>Adresse</td>
                <td><input type="text" name="ADRESSE" maxlength="512" value="${param.ADRESSE}" required></td>
            </tr>
            <tr>
                <td>Geburtsdatum</td>
                <td><input type="date" data-date="" data-date-format="yyyy/mm/dd" name="GEBURTSDATUM" value="${param.GEBURTSDATUM}" required></td>
            </tr>



        </table>

        <input style="float:right;margin-top:1rem;" type="submit" value="Angestellten erfassen" />
    </div>
</form>
