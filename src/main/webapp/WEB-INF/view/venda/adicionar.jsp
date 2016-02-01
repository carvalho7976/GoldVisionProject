<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Módulo Vendas - Adicionar</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<div class="panel-heading">
			<form:form servletRelativeAction="/venda/adicionar" method="post"
				modelAttribute="venda" class="form-horizontal" role="form">
				<fieldset>
				
				<!-- Form Name -->
				<legend>Cadastrar Venda</legend>
				
				
				<div class="form-group">
					<label for="clientes" class="col-sm-2 control-label">Clientes</label>
					<div class="col-sm-5">

						<form:select id="clientes" class="form-control"
							modelAttribute="venda" placeholder="Clientes"
							path="cliente" required="true">
							<form:option value="nenhuma">Selecione o Cliente</form:option>
							<c:forEach items="${clientes}" var="pessoaCliente">
								<form:option value="${pessoaCliente.id}">${pessoaCliente.nome} / ${pessoaCliente.cpf}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="cliente" cssClass="error" />
					</div>
				</div>
				
				
				
				<div class="form-group">
					<label for="produtos" >Produtos</label>
					<div class="col-sm-5">
						<form:select id="produtos" class="form-control"
							modelAttribute="produtoLista"
							path="produtos" required="true" >
							<form:option value="nenhuma">Selecione o Produtos</form:option>
							<c:forEach items="${produtoLista}" var="itemProduto">
								<form:option value="${itemProduto.id}">${itemProduto.codigo}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="produtos" cssClass="error" />
					</div>
				</div>
				
				
				<!-- Text input-->
				<div class="row">
					<div class="form-group" class="row">
						<label class="col-md-2 control-label" for="textinput">Valor
							de Venda</label>
						<div class="col-md-4">
							<input id="textinput" name="valorVenda" type="double"
								placeholder="ex: 200" class="form-control input-md" required="">

						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="textinput">Forma
							de Pagamento</label>
						<div class="col-md-4">
							<input id="textinput" name="formaPagamento" type="text"
								placeholder="ex: a vista" class="form-control input-md"
								required="">

						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="textinput">Dia
							de Vencimento</label>
						<div class="col-md-4">
							<input id="textinput" name="diaVencimento" type="number"
								placeholder="ex:2" class="form-control input-md" required="">

						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="textinput">Número
							de Parcelas</label>
						<div class="col-md-4">
							<input id="textinput" name="numParcelas" type="number"
								placeholder="ex:12" class="form-control input-md" required="">

						</div>
					</div>
				</div>

				
				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="textinput">Número
							de Parcelas Pagas</label>
						<div class="col-md-4">
							<input id="textinput" name="numParcelasPagas" type="number"
								placeholder="ex:1" class="form-control input-md" required="">

						</div>
					</div>
				</div>

				<!-- Button -->
				<div class="controls" align="center">
					<input id="criar" class="btn btn-primary" type="submit"
						value="Adicionar" /> <a href="<c:url value="/venda/"></c:url>"
						class="btn btn-danger">Cancelar</a>
				</div>
			</fieldset>
			</form:form>

		</div>
	</div>
	
</body>
</html>