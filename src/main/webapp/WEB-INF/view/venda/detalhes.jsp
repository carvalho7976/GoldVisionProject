<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalhes</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>
		
		<h2 align="center">Detalhes da Venda</h2>
		
		<div align="right">
			<div>
				<a href="<c:url value="/venda/editar/${venda.id}/"  ></c:url>">
					<button class="btn btn-warning">
						<span class="glyphicon glyphicon-edit"></span> Editar Venda
					</button>
				</a> <a href="<c:url value="/venda/apagar/${venda.id}/" ></c:url>">
					<button class="btn btn-danger">
						<span class="glyphicon glyphicon-trash"></span> Excluir Venda
					</button>
				</a>
			</div>
		</div>
		<div class="container">
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Data da Venda</label>
				<fmt:formatDate pattern="dd/MM/yyyy" value="${venda.dataVenda }" />
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Valor da Venda</label>
				${venda.valorVenda}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Dia de Vencimento</label>
				${venda.diaVencimento}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Número de Parcelas</label>
				${venda.numParcelas}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Número de Parcelas Pagas</label>
				${venda.numParcelasPagas}
			</div>
			<div class="col-sm-10">
				<label for="codigo" class="col-sm-10">Último Pagamento</label>
				<fmt:formatDate pattern="dd/MM/yyyy" value="${venda.ultimoPagamento }" />
			</div>
		</div>

	</div>
</body>
</html>