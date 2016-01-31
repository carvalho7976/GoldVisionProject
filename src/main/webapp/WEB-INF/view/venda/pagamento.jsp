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
			<br />
			<div class="halfContainer" align="center">
				<div class="littleBox" style="padding: 0px 12px;">
					<b>Dados da Venda</b> <br> <b>Valor de Venda: </b>${venda.valorVenda }<b>
					</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Forma de
						Pagamento: </b>${venda.formaPagamento}<b> </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>Dia de Vencimento: </b>${venda.diaVencimento }<b> </b><br>
				</div>
				<br />
				<br />
				<div class="littleBox" style="padding: 0px 12px;">
					<b>Dados do Pagamento</b> <br> <b>Número de Parcelas: </b>${venda.numParcelas }<b>
					</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Número de
						Parcelas Pagas: </b>${venda.numParcelasPagas}<b> </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>Último Pagamento: </b>
					<fmt:formatDate pattern="dd/MM/yyyy"
						value="${venda.ultimoPagamento }" />
					<b> </b><br>
				</div>
				<br />
				<br />
				<div class="littleBox" style="padding: 0px 12px;">
					<b>Próximo Pagamento</b> <br> <b>Número de Parcelas a
						serem pagas: </b>
					<form:select path="numParcelas">
						<c:forEach var="i" begin="1" end="${numeroParcelasPagamento}">
							<form:option value="${i}">${i} Parcela(s)</form:option>
						</c:forEach>
					</form:select>
					
				</div>
				<br />
				<br />
				<!-- Button -->
				<div class="form-group">
					<div class="row">
						<label class="col-md-4 control-label" for="salvar"></label>
						<div class="col-md-4">
							<button id="salvar" name="salvar" class="btn btn-primary">Atualizar</button>
							<a href="<c:url value="/venda/" ></c:url>">
								<button type="button" class="btn btn-danger">Cancelar</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>