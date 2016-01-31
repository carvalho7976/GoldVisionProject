<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar</title>
<jsp:include page="../../../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../../../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<div class="panel-heading">
			<form:form servletRelativeAction="/modelo/adicionar" method="post"
				modelAttribute="modelo" class="form-horizontal" role="form">

				<fieldset>
					<!-- Form Name -->
					<legend>Adicionar Modelo</legend>

					<!-- Text input-->
				</fieldset>

				<div class="form-group">
					<label for="nomeModelo" class="col-sm-2 control-label">Nome
						do Modelo</label>
					<div class="col-sm-10">
						<form:input id="nomeModelo" class="form-control"
							placeholder="Nome do Modelo" path="nomeModelo" />
					</div>
				</div>
				<div class="form-group">
					<label for="codigo" class="col-sm-2 control-label">Codigo</label>
					<div class="col-sm-10">
						<form:input id="codigo" class="form-control" placeholder="Código"
							path="codigo" />
					</div>
				</div>

				<div class="form-group">
					<label for="marca" class="col-sm-2 control-label">Marca do
						Modelo</label>
					<div class="col-sm-5">

						<form:select id="marca" class="form-control"
							modelAttribute="produto" placeholder="Marca do Modelo"
							path="marca" required="true">
							<form:option value="nenhuma">Selecione a marca</form:option>
							<c:forEach items="${marca}" var="itemMarca">
								<form:option value="${itemMarca.id}">${itemMarca.nomeMarca}</form:option>
							</c:forEach>

						</form:select>
						<form:errors path="marca" cssClass="error" />
					</div>
				</div>

				<div class="controls" align="center">
					<input id="criar" class="btn btn-primary" type="submit"
						value="Adicionar" /> <a
						href="<c:url value="/modelo/listar"></c:url>"
						class="btn btn-danger">Cancelar</a>
				</div>
			</form:form>

		</div>
	</div>
	</div>
</body>
</html>