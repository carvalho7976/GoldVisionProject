<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>
		<h1>Modulo Clientes</h1>

		<br />
		<table class="table" id="tableAniversariantes">
			<thead>
				<tr>
					<th>nome</th>
					<th>Endereço</th>
					<th>Telefone</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${aniversariantes}" var="aniversariante">
					<tr>
						<td>${aniversariante.nome}</td>
						<td>${aniversariante.endereco }</td>
						<td>${aniversariante.telefone}</td>
						<td><a
							href="<c:url value="/cliente/detalhes/${aniversariante.id }/" ></c:url>">
								<button type="button" class="btn btn-info">
									<span class="glyphicon glyphicon-file"></span> Detalhes
								</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>