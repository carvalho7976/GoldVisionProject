<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalhes</title>
<jsp:include page="../../fragments/headTag.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../../fragments/menu.jsp" />
		<h2 align="center"> Detalhes de Marca - ${marca.nomeMarca} (${marca.codigo})</h2>
		<div class="container">

			<a href="<c:url value="/marca/${marca.id}/editar" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> Editar Marca
				</button>
			</a>
			<table class="table" id="tableModelos">
				<thead>
					<tr>
						<th>Codigo do Modelo</th>
						<th>Nome do Modelo</th>
					</tr>
				</thead>
				<c:forEach var="modelo" items="${marca.modelos}">
					<tr>
						<td>${modelo.codigo}</td>
						<td>${modelo.nomeModelo}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>