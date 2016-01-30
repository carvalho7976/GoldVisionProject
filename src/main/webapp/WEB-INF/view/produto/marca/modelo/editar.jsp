<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar</title>
<jsp:include page="../../../fragments/headTag.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../../../fragments/menu.jsp" />
		<form:form servletRelativeAction="/modelo/${modelo.id}/editar"
			method="post" modelAttribute="modelo" class="form-horizontal"
			role="form">

			<div class="form-group">

					<label for="nomeModelo" class="col-sm-1 control-label">Nome
						do Modelo</label>
					<div class="col-sm-10">
						<form:input id="nomeModelo" class="form-control"
							placeholder="Nome do Modelo" path="nomeModelo" />
					</div>
				</div>
				<div class="form-group">
					<label for="codigo" class="col-sm-1 control-label">Codigo</label>
					<div class="col-sm-10">
						<form:input id="codigo" class="form-control"
							placeholder="Código" path="codigo" />
					</div>
				</div>

			<div class="form-group">
				<label for="marca" class="col-sm-1 control-label">Marca</label>
				<div class="col-sm-10">
					<form:select id="marca" class="form-control"
						modelAttribute="modelo" placeholder="Marca do Modelo"
						path="marca" required="true">
						<form:option value="${modelo.marca.id}">${modelo.marca.nomeMarca}</form:option>
						<c:forEach items="${listaMarcas}" var="itemModelo">
							<form:option value="${itemModelo.id}">${itemModelo.nomeMarca}</form:option>
						</c:forEach>

					</form:select>
					<form:errors path="marca" cssClass="error" />
				</div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Atualizar" /> <a
					href="<c:url value="/modelo/listar"></c:url>"
					class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
	</div>
</body>
</html>