<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalhes</title>
<jsp:include page="../../../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../../../fragments/menu.jsp" />
	<div class="container">
		<div role="main" class="col-md-6 col-md-push-3">
			<h2 align="center">Detalhes do Modelo</h2>
			<div align="right">
				<div class="col-sm-10">
					<a href="<c:url value="/modelo/${modelo.id}/editar"  ></c:url>">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-plus"></span> Editar Modelo
						</button>
					</a> <a href="<c:url value="/modelo/${modelo.id}/excluir" ></c:url>">
						<button class="btn btn-danger">
							<span class="glyphicon glyphicon-trash"></span> Excluir Modelo
						</button>
					</a>
				</div>
			</div>
			<div class="container">
				<div class="col-sm-10">
					<label for="codigo" class="col-sm-10">Código do Modelo</label>
					${modelo.codigo}
				</div>
				<div class="col-sm-10">
					<label for="nomeModelo" class="col-sm-10">Nome do Modelo</label>
					${modelo.nomeModelo}
				</div>
				<div class="col-sm-10">
					<label for="nomeMarca" class="col-sm-10">Marca</label>
					${modelo.marca.nomeMarca}
				</div>
			</div>
		</div>
	</div>
</body>
</html>