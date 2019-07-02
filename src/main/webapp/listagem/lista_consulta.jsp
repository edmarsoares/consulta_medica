<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/lista.css" rel="stylesheet" type="text/css">

<title>Lista de consultas</title>
</head>
<body>
	<h3 align="center">Consultas cadastradas</h3>
	
		<div align="right">
			<form action="consulta" method="get">
		   		Consultar por data: <input type="date" name="dataAgendamento"  value="" /> 
		   		
				<input  type="submit" value="consultar" />    
			</form>
			<div>
			<c:if test="${not empty mensagem}">
				<p class="alert">
					${mensagem}
				</p>
			</c:if>	</div>
		</div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Médico</th>
                <th>Paciente</th>
				<th>delete</th>
                <th>Reagendar</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${consultas}" var="consulta">
                <tr>
                    <td><c:out value="${consulta.id}" /></td>
                    <td><c:out value="${consulta.descricao}" /></td>
					<td><c:out value="${consulta.medico.nome}" /></td>
					<td><c:out value="${consulta.agendamento.paciente.nome}" /></td>
                    <td><a href="consulta?action=delete&id=<c:out value="${consulta.id}"/>">Delete</a></td>
					<td><a href="consulta?action=editar&id=<c:out value='${consulta.id}' />">reagendar consulta</a></td>
					
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="footer">
	   	<a href="consulta?action=cadastro">adicionar nova consulta</a>
		<a href="home?action=home">home</a>
    </div>
 	</body>
</html>