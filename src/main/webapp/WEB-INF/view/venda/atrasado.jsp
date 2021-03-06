<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Módulo Vendas - Atrasados</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<h3>Pagamentos Atrasados do Mês</h3>
		
		<label>
			Montate esperado - ${montante }
		</label>
		<br />
		<div class="">
			<table class="table table-striped" id="tableVenda">
				<thead>
					<tr>
						<th>Data da Venda</th>
						<th>Dia de vencimento</th>
						<th>Valor da Parcela</th>
						<th>Número de Parcelas</th>
						<th>Número de Parcelas Pagas</th>
						<th>Último Pagamento</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cobrancas}" var="cobranca">

						<tr>
							<td><fmt:formatDate pattern="dd/MM/yyyy"
									value="${cobranca.dataVenda}" /></td>
							<td>${cobranca.diaVencimento}</td>
							<td>${cobranca.valorParcela}</td>
							<td>${cobranca.numParcelas}</td>
							<td>${cobranca.numParcelasPagas}</td>
							<td><fmt:formatDate pattern="dd/MM/yyyy"
									value="${cobranca.ultimoPagamento}" /></td>
							<td><a
								href="<c:url value="/venda/pagamento/${cobranca.id}/" ></c:url>">
									<button class="btn btn-warning">
										<span class="glyphicon glyphicon-edit"></span> Realizar Pagamento
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