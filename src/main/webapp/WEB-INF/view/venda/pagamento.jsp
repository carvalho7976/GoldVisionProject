<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gold Vision</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<form:form servletRelativeAction="/venda/pagamento/${venda.id}/"
			method="post" modelAttribute="venda" class="form-horizontal"
			role="form">

			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Realizar
					Pagamento</label>
			</div>

			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="valorVenda">Valor
						de Venda</label>${venda.valorVenda }
				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="formaPagamento">Forma
						de Pagamento - ${venda.formaPagamento}</label>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="diaVencimento">Dia
						de Vencimento - ${venda.diaVencimento }</label>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="numParcelas">Numero
						de Parcelas - ${venda.numParcelas }</label>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="numParcelasPagas">Numero
						de Parcelas Pagas - ${venda.numParcelasPagas }</label>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="ultimoPagamento">Ultimo
						Pagamento - <fmt:formatDate pattern="dd/MM/yyyy"
							value="${venda.ultimoPagamento }" />
					</label>
				</div>
			</div>

			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="numParcelas">Número
						de parcelas a serem pagas </label>
					<form:select path="numParcelas">
						<c:forEach var="i" begin="1" end="${numeroParcelasPagamento}">
							<form:option value="${i}">${i} Parcela(s)</form:option>
						</c:forEach>
					</form:select>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<div class="row">
					<label class="col-md-4 control-label" for="salvar"></label>
					<div class="col-md-4">
						<button id="salvar" name="salvar" class="btn btn-primary">Atualizar</button>
						<a href="<c:url value="pagamento/${venda.id }/" ></c:url>">
							<button type="button" class="btn btn-danger">Cancelar</button>
						</a>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>