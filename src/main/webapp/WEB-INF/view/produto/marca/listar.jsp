<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar</title>
<jsp:include page="../../fragments/headTag.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../../fragments/menu.jsp" />
		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/marca/adicionar" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span>Adicionar Nova Marca
				</button>
			</a>
		</div>

		<div class="container">

			<table class="table" id="tableCliente">
				<thead>
					<tr>
						<th>Nome da Marca</th>
						<th>Código</th>
					</tr>
				</thead>
				<c:forEach var="marca" items="${listaMarcas}">
					<tr>
						<td>${marca.nomeMarca}</td>
						<td>${marca.codigo}</td>
						<td><a
							href="<c:url value="/marca/${marca.id}/detalhes" ></c:url>">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> Detalhes
								</button>
						</a><a
							href="<c:url value="/marca/${marca.id}/editar" ></c:url>">
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-edit"></span> Editar Marca
								</button>
						</a><a
							href="<c:url value="/marca/${marca.id}/excluir" ></c:url>">
								<button class="btn btn-danger">
									<span class="glyphicon glyphicon-trash"></span> Excluir Marca
								</button>
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>