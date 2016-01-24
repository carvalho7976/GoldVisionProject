<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gold Vision</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../fragments/menu.jsp" />

	<div class="container">
		<h1>Modulo Vendas</h1>
		<div class="row">
			<div class="col-xs-12 col-md-8"></div>
			<div class="col-xs-6 col-md-4">
				<a href="cadastrar/">
					<button type="button" class="btn btn-primary btn-sm">Cadastrar
						venda</button>
				</a>
			</div>
		</div>
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
						<th>Valor de Venda</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vendas}" var="venda">

						<tr>
							<td>${venda.dataVenda}</td>
							<td>${venda.valorVenda}</td>
							<td>${venda.diaVencimento }</td>
							<td>${venda.formaPagamento}</td>
							<td>${venda.numParcelas}</td>
							<td>${venda.numParcelasPagas}</td>
							<td>${venda.ultimoPagamento}</td>

							<td>
								
								<a
								href="<c:url value="editar/${venda.id }/" ></c:url>">
									<button type="button" class="btn btn-warning">Editar</button>
							</a> <a href="<c:url value="/venda/apagar/${venda.id }/" ></c:url>">
									<button type="button" class="btn btn-danger">Apagar</button>
							</a>
							</td>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>