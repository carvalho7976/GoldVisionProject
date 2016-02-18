<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Módulo Produtos - Detalhamento</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>
		
		<h2 align="center">Detalhes do Produto</h2>
		
		<div align="right">
			<div>
				<a href="<c:url value="/produto/${produto.id}/editar"  ></c:url>">
					<button class="btn btn-warning">
						<span class="glyphicon glyphicon-edit"></span> Editar Produto
					</button>
				</a> <a href="<c:url value="/produto/${produto.id}/excluir" ></c:url>">
					<button class="btn btn-danger">
						<span class="glyphicon glyphicon-trash"></span> Excluir Produto
					</button>
				</a>
			</div>
		</div>
		<div class="container">
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Código do Produto</label>
				${produto.codigo}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Quantidade</label>
				${produto.quantidade}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Marca</label>
				${produto.marca.nomeMarca}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Modelo</label>
				${produto.modelo.nomeModelo}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Valor de Venda</label>
				${produto.valorVenda}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Valor de Compra</label>
				${produto.valorCompra}
			</div>
		</div>

	</div>
</body>
</html>