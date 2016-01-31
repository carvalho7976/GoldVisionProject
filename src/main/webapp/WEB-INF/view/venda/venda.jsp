<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Adicionar Venda</title>
<jsp:include page="../fragments/headTag.jsp" />
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form class="form-horizontal" name='vendaForm'
			action="<c:url value='/venda/save/' />" method='POST'>
			<fieldset>

				<!-- Form Name -->
				<legend>Cadastrar Venda</legend>

				<!-- Text input-->
				<div class="row">
					<div class="form-group" class="row">
						<label class="col-md-2 control-label" for="valorVenda">Valor
							de Venda</label>
						<div class="col-md-4">
							<input id="valorVenda" name="valorVenda" type="number"
								placeholder="ex: 200" class="form-control input-md" required="">

						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="formaPagamento">Forma
							de Pagamento</label>
						<div class="col-md-4">
							<input id="formaPagamento" name="formaPagamento" type="text"
								placeholder="ex: a vista" class="form-control input-md"
								required="">

						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="diaVencimento">Dia
							de Vencimento</label>
						<div class="col-md-4">
							<input id="diaVencimento" name="diaVencimento" type="number"
								placeholder="ex:2" class="form-control input-md" required="">

						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="row">
					<div class="form-group">
						<label class="col-md-2 control-label" for="numParcelas">Número
							de Parcelas</label>
						<div class="col-md-4">
							<input id="numParcelas" name="numParcelas" type="number"
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
		</form>
	</div>
</body>
</html>