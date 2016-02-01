<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		<h1>Modulo Vendas</h1>

		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/venda/cobrancas/" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-file"></span> Relatório de
					Cobrancas
				</button>
			</a>
		</div>
		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/venda/cadastrar/" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> Adicionar Nova Venda
				</button>
			</a>
		</div>
		<br />
		<div class="">
			<table class="table table-striped" id="tableVenda">
				<thead>
					<tr>
						<th>Data da Venda</th>
						<th>Valor de Venda</th>
						<th>Cliente (Detalhes)</th>
						<th>Produto (Detalhes)</th>
						<th>Atualização</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vendas}" var="venda">

						<tr>
							<td><fmt:formatDate pattern="dd/MM/yyyy"
									value="${venda.dataVenda}" /></td>
							<td>${venda.valorVenda}</td>
							<th><a
								href="<c:url value="/cliente/detalhes/${venda.cliente.id }/" ></c:url>">
									<button type="button" class="btn btn-info">
										<span class="glyphicon glyphicon-file"></span> ${venda.cliente.nome }
									</button>
							</a></th>
							<th><a
								href="<c:url value="/produto/${venda.produto.id}/detalhes" ></c:url>">
									<button type="button" class="btn btn-info">
										<span class="glyphicon glyphicon-file"></span> ${venda.produto.codigo}
									</button>
							</a></th>
							<td><a
								href="<c:url value="/venda/detalhes/${venda.id}/" ></c:url>">
									<button class="btn btn-info">
										<span class="glyphicon glyphicon-file"></span> Detalhes da
										Venda
									</button>
							</a><a href="<c:url value="/venda/editar/${venda.id}/" ></c:url>">
									<button class="btn btn-warning">
										<span class="glyphicon glyphicon-edit"></span> Editar Venda
									</button>
							</a><a href="<c:url value="/venda/apagar/${venda.id}/" ></c:url>">
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