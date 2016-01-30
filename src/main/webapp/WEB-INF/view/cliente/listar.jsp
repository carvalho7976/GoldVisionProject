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
		
		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/cliente/cadastrar/" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> Adicionar Novo Cliente
				</button>
			</a>
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
								<button type="button" class="btn btn-info">
									<span class="glyphicon glyphicon-file"></span> Detalhes
								</button>
						</a> <a
							href="<c:url value="/cliente/editar	/${cliente.id }/" ></c:url>">
								<button type="button" class="btn btn-warning">
									<span class="glyphicon glyphicon-edit"></span> Editar Cliente
								</button>
						</a> <a
							href="<c:url value="/cliente/apagar/${cliente.id }/" ></c:url>">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-trash"></span> Excluir Cliente
								</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>