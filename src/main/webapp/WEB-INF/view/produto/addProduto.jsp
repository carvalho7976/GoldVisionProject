<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar</title>
</head>
<body>
	<jsp:include page="../fragments/menu.jsp" />


	<div id="container">
		<jsp:include page="../fragments/headTag.jsp" />
		<form:form servletRelativeAction="/produto/adicionar" method="post"
			modelAttribute="produto" class="form-horizontal">
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar
					Curso</label>
			</div>

			<div class="form-group">
				<label for="codigo" class="col-sm-1 control-label">Código</label>
				<div class="col-sm-10">
					<form:input id="codigo" class="form-control" placeholder="Código"
						path="codigo" />
					<form:errors path="codigo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="nome" class="col-sm-1 control-label">Nome do
					Produto</label>
				<div class="col-sm-10">
					<form:input id="nome" class="form-control" placeholder="Nome"
						path="nome" />
					<form:errors path="nome" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="sigla" class="col-sm-1 control-label">Quantidade</label>
				<div class="col-sm-10">
					<form:input id="qtd" class="form-control" placeholder="Quantidade"
						path="qtd" />
					<form:errors path="qtd" cssClass="error" />
				</div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Adicionar" /> <a
					href="<c:url value="/produto/listar"></c:url>"
					class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>