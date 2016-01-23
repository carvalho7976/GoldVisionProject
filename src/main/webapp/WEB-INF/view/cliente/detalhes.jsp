<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../fragments/menu.jsp" />

	<div class="container">
		<div class="row">
			<h3>Informações</h3>
		</div>
		<div class="row">
		<h5 class="col-md-4">Nome: ${cliente.nome }</h5>
		<h5 class="col-md-4">Telefone: ${cliente.telefone }</h5> 
		</div>
		<div class="row">
		<h5 class="col-md-4">Endereço: ${cliente.endereco }</h5>
		<h5 class="col-md-4">Data nascimento: ${cliente.dataNasc }</h5> 
		</div>
		<div class="row">
		<h5 class="col-md-4">RG: ${cliente.rg }</h5>
		<h5 class="col-md-4">CPF: ${cliente.cpf }</h5> 
		</div>
	</div>
</body>
</html>