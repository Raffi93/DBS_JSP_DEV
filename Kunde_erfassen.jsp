<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4b20_06"
        password="to0ieto0A"
/>


<div style="text-align: center; width: 100%;"><h2>Person erfassen</h2></div>

<form method="post" action="Angestellter_save.jsp">
    <div>
        <input type="hidden" name="menu" value="person" />
        <input type="hidden" name="test" value="2" />

        <table width="600">

            <tr>
                <td>SVN</td>
                <td><input type="number" name="SVN" max="9999999999" value="${param.SVN}" size="10"></td>
            </tr>
            <tr>
                <td>Nachname</td>
                <td><input type="text" name="NACHNAME" maxlength="80" value="${param.NACHNAME}" size="20"></td>
            </tr>
            <tr>
                <td>Vorname</td>
                <td><input type="text" name="VORNAME" maxlength="80" value="${param.VORNAME}" size="20"></td>
            </tr>
            <tr>
                <td>Adresse</td>
                <td><input type="text" name="ADRESSE" maxlength="512" value="${param.ADRESSE}" size="80"></td>
            </tr>
            <tr>
                <td>Geburtsdatum</td>
                <td><input type="date" data-date="" data-date-format="yyyy/mm/dd" name="GEBURTSDATUM" value="${param.GEBURTSDATUM}"></td>
            </tr>



        </table>

        <input type="submit" value="Angestellten erfassen" />
    </div>
</form>
<div style="position: fixed; text-align: lef; bottom: 0px; width: 100%;"><a href="index.jsp">Back</a> to Start</div>