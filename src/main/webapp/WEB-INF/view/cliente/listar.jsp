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
		<h1>Modulo Clientes</h1>
		<div class="row">
			<div class="col-xs-12 col-md-8"></div>
			<div class="col-xs-6 col-md-4">
				<a href="cadastrar/">
					<button type="button" class="btn btn-primary">Cadastrar
						cliente</button>
				</a>
			</div>
		</div>
		<br />
		<table class="table" id="tableCliente">
			<thead>
				<tr>
					<th>nome</th>
					<th>Endereço</th>
					<th>Telefone</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clientes}" var="cliente">
					<tr>
						<td>${cliente.nome}</td>
						<td>${cliente.endereco }</td>
						<td>${cliente.telefone}</td>
						<td><a
							href="<c:url value="/cliente/detalhes/${cliente.id }/" ></c:url>">
								<button type="button" class="btn btn-info">Detalhes</button>
						</a> <a
							href="<c:url value="/cliente/editar	/${cliente.id }/" ></c:url>">
								<button type="button" class="btn btn-warning">Editar</button>
						</a> <a
							href="<c:url value="/cliente/apagar/${cliente.id }/" ></c:url>">
								<button type="button" class="btn btn-danger">Apagar</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>