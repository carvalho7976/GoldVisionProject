<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		<h2 align="center">Detalhes do Cliente</h2>

		<div align="right">
			<div>
				<a href="<c:url value="/cliente/editar/${cliente.id}/"  ></c:url>">
					<button class="btn btn-warning">
						<span class="glyphicon glyphicon-edit"></span> Editar Cliente
					</button>
				</a> <a href="<c:url value="/cliente/apagar/${cliente.id}/" ></c:url>">
					<button class="btn btn-danger">
						<span class="glyphicon glyphicon-trash"></span> Excluir Cliente
					</button>
				</a>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-10">
				<label for="nome" class="col-sm-10">Nome</label> ${cliente.nome }
			</div>
			<div class="col-sm-10">
				<label for="telefone" class="col-sm-10">Telefone</label>
				${cliente.telefone }
			</div>
			<div class="col-sm-10">
				<label for="endereco" class="col-sm-10">Endereco</label>
				${cliente.endereco }
			</div>
			<div class="col-sm-10">
				<label for="cpf" class="col-sm-10">CPF</label> ${cliente.cpf }
			</div>
			<div class="col-sm-10">
				<label for="rg" class="col-sm-10">RG</label> ${cliente.rg }
			</div>
			<div class="col-sm-10">
				<label for="dataNasc" class="col-sm-10">Data nascimento</label>
				<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.dataNasc }" />
			</div>
		</div>
	</div>
</body>
</html>