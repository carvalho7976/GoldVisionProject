<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Módulo Vendas - Editar</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		
		
		<form:form servletRelativeAction="/venda/editar2/${venda.id}/"
			method="post" modelAttribute="venda" class="form-horizontal"
			role="form">

			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Editar
					Venda</label>
			</div>
			
			<div class="form-group">
					<label for="clientes" class="col-sm-2 control-label">Clientes</label>
					<div class="col-sm-5">

						<form:select id="clientes" class="form-control"
							modelAttribute="venda" placeholder="Clientes"
							path="cliente" required="true">
							<form:option value="${venda.cliente.id}"> ${venda.cliente.nome}</form:option>
							<c:forEach items="${clientes}" var="pessoaCliente">
								<form:option value="${pessoaCliente.id}">${pessoaCliente.nome} / ${pessoaCliente.cpf}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="cliente" cssClass="error" />
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="produtos" class="col-sm-2 control-label">Produtos</label>
					<div class="col-sm-5">

						<form:select id="produtos" class="form-control"
							modelAttribute="venda" placeholder="Produtos"
							path="produto" required="true">
							<form:option value="${venda.produto.id}"> ${venda.produto.codigo}</form:option>
							<c:forEach items="${produtos}" var="itemProduto">
								<form:option value="${itemProduto.id}">${itemProduto.codigo}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="produto" cssClass="error" />
					</div>
				</div>
			
			<div class="form-group">
					<label class="col-md-2 control-label" for="valorVenda">Valor
						de Venda</label>
					<div class="col-md-4">
						<input id="valorVenda" name="valorVenda" type="number"
							value="${venda.valorVenda }" class="form-control input-md"
							required>
				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
					<label class="col-md-2 control-label" for="formaPagamento">Forma
						de Pagamento</label>
					<div class="col-md-4">
						<input id="formaPagamento" name="formaPagamento" type="text"
							value="${venda.formaPagamento}" class="form-control input-md">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
					<label class="col-md-2 control-label" for="diaVencimento">Dia
						de Vencimento</label>
					<div class="col-md-4">
						<input id="diaVencimento" name="diaVencimento" type="number"
							value="${venda.diaVencimento }" class="form-control input-md"
							required>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
					<label class="col-md-2 control-label" for="numParcelas">Numero
						de Parcelas</label>
					<div class="col-md-4">
						<input id="numParcelas" name="numParcelas" type="number"
							value="${venda.numParcelas }" class="form-control input-md"
							required>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
					<label class="col-md-2 control-label" for="numParcelasPagas">Numero
						de Parcelas Pagas</label>
					<div class="col-md-4">
						<input id="numParcelasPagas" name="numParcelasPagas" type="number"
							value="${venda.numParcelasPagas}" class="form-control input-md">
					</div>
				</div>

			<!-- Text input-->
			<div class="form-group">
					<label class="col-md-2 control-label" for="numParcelasPagas">Último
						Pagamento</label>
					<div class="col-md-4">
						<input id="ultimoPagamento" name="ultimoPagamento" type="text"
							value="<fmt:formatDate pattern="dd/MM/yyyy" value="${venda.ultimoPagamento }" />" class="form-control input-md">
					</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="salvar"></label>
					<div class="col-md-4">
						<button id="salvar" name="salvar" class="btn btn-primary">Salvar</button>
						<a href="<c:url value="/venda/" ></c:url>">
							<button type="button" class="btn btn-danger">Cancelar</button>
						</a>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>

