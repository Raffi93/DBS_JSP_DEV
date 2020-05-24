<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="user"
        password="password"
/>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<h2>Datum ausw&auml;hlen</h2>

<p>Bitte w&auml;hlen Sie das Datum f&uuml;r die gew&uuml;nschte Massage aus.</p>

<form method="post" action="massage.jsp">
    <div class="datepicker date input-group p-0 shadow-sm">
        <input type="text" placeholder="Choose a reservation date" class="form-control" id="reservationDate">
        <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-calendar"></i></span></div>
    </div>
    <br/>
    <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-ok"></span> Ausw&auml;hlen
    </button>
</form>