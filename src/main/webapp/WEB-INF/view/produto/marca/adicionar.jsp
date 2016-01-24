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
<jsp:include page="../../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../../fragments/menu.jsp" />
	<div id="container" align="center">
		
		<div class="panel-heading">
			<form:form servletRelativeAction="/marca/adicionar" method="post"
				modelAttribute="marca" class="form-horizontal" role="form">
				<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar Marca</label>
			</div>
				<div class="form-group">

					<label for="nomeMarca" class="col-sm-1 control-label">Nome
						da Marca</label>
					<div class="col-sm-10">
						<form:input id="nomeMarca" class="form-control"
							placeholder="Nome da Marca" path="nomeMarca" />
						<form:errors path="nomeMarca" cssClass="error" />
					</div>
				</div>
				<div class="form-group">
					<label for="codigo" class="col-sm-1 control-label">Codigo</label>
					<div class="col-sm-10">
						<form:input id="codigo" class="form-control"
							placeholder="Quantidade" path="codigo" />
						<form:errors path="codigo" cssClass="error" />
					</div>
				</div>
				<div class="controls">
					<input id="criar" class="btn btn-primary" type="submit"
						value="Adicionar" /> <a
						href="<c:url value="/marca/listar"></c:url>"
						class="btn btn-default">Cancelar</a>
				</div>
			</form:form>

		</div>
	</div>
</body>
</html>