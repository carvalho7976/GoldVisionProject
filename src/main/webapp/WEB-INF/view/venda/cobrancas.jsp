<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Módulo Vendas - Cobraça</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<h3>Cobranças do Mês</h3>
		
		<label>
			Montate esperado - ${montante }
		</label>
		
		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/venda/atrasado/" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-file"></span> Pagamentos Atrasados
				</button>
			</a>
		</div>
		<br />
		<div class="">
			<table class="table table-striped" id="tableVenda">
				<thead>
					<tr>
						<th>Data da Venda</th>
						<th>Dia vencimento</th>
						<th>Valor de Venda</th>
						<th>Valor da Parcela</th>
						<th>Núm de Parcelas</th>
						<th>Núm de Parcelas Pagas</th>
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
							<td>${cobranca.valorVenda}</td>
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