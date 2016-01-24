<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Produto</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../fragments/menu.jsp" />

	<div id="container" align="center">
		

		<form:form servletRelativeAction="/produto/adicionar" method="post"
			modelAttribute="produto" role="form">
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar
					Produto</label>
			</div>

			<div class="form-group">
				<label for="codigo" class="col-sm-2 control-label">Código</label>
				<div class="col-sm-10">
					<form:input id="codigo" class="form-control" placeholder="Codigo"
						path="codigo" />
					<form:errors path="codigo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="quantidade" class="col-sm-2 control-label">Quantidade</label>
				<div class="col-sm-10">
					<form:input id="quantidade" class="form-control"
						placeholder="Quantidade" path="quantidade" />
					<form:errors path="quantidade" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="valorCompra" class="col-sm-2 control-label">Valor
					de Compra</label>
				<div class="col-sm-10">

					<form:input id="valorCompra" class="form-control" placeholder="100"
						path="valorCompra" />
					<form:errors path="valorCompra" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="valorVenda" class="col-sm-2 control-label">Valor
					de Venda</label>
				<div class="col-sm-10">
					<form:input id="valorVenda" class="form-control" placeholder="150"
						path="valorVenda" />
					<form:errors path="valorVenda" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="marca" class="col-sm-2 control-label">Marca</label>
				<div class="col-sm-10">

					<form:select id="marca" class="form-control"
						modelAttribute="produto" placeholder="Marca do Produto"
						path="marca" required="true">
						<form:option value="nenhuma">Selecione a marca</form:option>
						<c:forEach items="${listaMarcas}" var="itemMarca">
							<form:option value="${itemMarca.id}">${itemMarca.nomeMarca}</form:option>
						</c:forEach>

					</form:select>
					<form:errors path="marca" cssClass="error" />
				</div>
			</div>
			
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Adicionar" /> <a
					href="<c:url value="/produto/listar"></c:url>"
					class="btn btn-danger">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>