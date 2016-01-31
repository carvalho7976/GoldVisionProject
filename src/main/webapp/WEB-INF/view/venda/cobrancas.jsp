<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Módulo Vendas - Listagem</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />

		<h3>Cobranças do Mês</h3>

		<br />
		<div class="">
			<table class="table table-striped" id="tableVenda">
				<thead>
					<tr>
						<th>Data da Venda</th>
						<th>Valor de Venda</th>
						<th>Dia do Vencimento</th>
						<th>Forma de Pagamento</th>
						<th>Número de Parcelas</th>
						<th>Número de Parcelas Pagas</th>
						<th>Último Pagamento</th>
						<th>Atualização</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cobrancas}" var="cobranca">

						<tr>
							<td><fmt:formatDate pattern="dd/MM/yyyy" value="${cobranca.dataVenda}" /></td>
							<td>${cobranca.valorVenda}</td>
							<td>${cobranca.diaVencimento }</td>
							<td>${cobranca.formaPagamento}</td>
							<td>${cobranca.numParcelas}</td>
							<td>${cobranca.numParcelasPagas}</td>
							<td><fmt:formatDate pattern="dd/MM/yyyy" value="${cobranca.ultimoPagamento}" /></td>
							<td><a href="<c:url value="/venda/editar/${cobranca.id}/" ></c:url>">
									<button class="btn btn-warning">
										<span class="glyphicon glyphicon-edit"></span> Editar Venda
									</button>
							</a></td>
							<td> <a href="<c:url value="/venda/apagar/${cobranca.id}/" ></c:url>">
									<button class="btn btn-danger">
										<span class="glyphicon glyphicon-trash"></span> Excluir Venda
									</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>