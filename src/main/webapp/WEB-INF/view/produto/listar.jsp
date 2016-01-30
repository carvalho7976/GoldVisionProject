<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Módulo Produtos - Listagem</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<h1 align="left">Modulo Produtos</h1>
		
		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/produto/adicionar" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span>Adicionar Novo
					Produto
				</button>
			</a>
		</div>
		<table class="table" id="tableProduto">
			<thead>
				<tr>
					<th>Código</th>
					<th>Quantidade</th>
					<th>Marca</th>
					<th>Valor de Compra</th>
					<th>Valor de Venda</th>
				</tr>
			</thead>
			<c:forEach var="produto" items="${listaProdutos}">
				<tr>
					<td>${produto.codigo}</td>
					<td>${produto.quantidade}</td>
					<td>${produto.marca.nomeMarca}</td>
					<td>${produto.valorCompra}</td>
					<td>${produto.valorVenda}</td>
					<td><a
						href="<c:url value="/produto/${produto.id}/detalhes" ></c:url>">
							<button class="btn btn-info">
								<span class="glyphicon glyphicon-file"></span> Detalhes
							</button>
					</a><a href="<c:url value="/produto/${produto.id}/editar" ></c:url>">
							<button class="btn btn-warning">
								<span class="glyphicon glyphicon-edit"></span> Editar Produto
							</button>
					</a><a href="<c:url value="/produto/${produto.id}/excluir" ></c:url>">
							<button class="btn btn-danger">
								<span class="glyphicon glyphicon-trash"></span> Excluir Produto
							</button>
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>