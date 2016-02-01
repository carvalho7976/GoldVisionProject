<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar</title>
<jsp:include page="../fragments/headTag.jsp" />

<c:url var="listaModelosURL" value="/produto/modelos" />
<c:url var="listaMarcasURL" value="/produto/marcas" />


</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>
		<c:if test="${not empty error}">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${error}"></c:out>
			</div>
		</c:if>
		<c:if test="${not empty info}">
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>

		<form:form servletRelativeAction="/produto/adicionar" method="post"
			modelAttribute="produto" role="form">

			<fieldset>
				<!-- Form Name -->
				<legend>Adicionar Produto</legend>

				<!-- Text input-->

			</fieldset>

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


					<form:select id="marcaSelect" class="form-control"
						modelAttribute="produto" placeholder="Marca do Produto"
						path="marca" required="true">
						<form:option value="nenhuma">Selecione a marca</form:option>
						<c:forEach items="${listaMarcas}" var="itemMarca">
							<form:option value="${itemMarca.id}">${itemMarca.nomeMarca}</form:option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label for="modelo" class="col-sm-2 control-label">Modelo</label>
				<div class="col-sm-10">
					<form:select path="modelo" id="modeloSelect" class="form-control">
						<form:option value="nenhuma">Selecione o modelo</form:option>
					</form:select>


					<form:errors path="modelo" cssClass="error" />
				</div>
			</div>

			<div class="controls" align="center">
				<br /> <br /> <input id="criar" class="btn btn-primary"
					type="submit" value="Adicionar" /> <a
					href="<c:url value="/produto/listar"></c:url>"
					class="btn btn-danger">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>

	<script type="text/javascript">
		$('#marcaSelect')
				.change(
						function() {
							$
									.ajax({
										type : "GET",
										url : "/GoldVisionProject/produto/getModeloPorMarca",
										data : {
											marcaId : $('#marcaSelect').val()
										},
										success : function(data) {
											$('#modeloSelect').empty(); //remove all child nodes
											for (var i = 0; i < data.length; i++) {
												var newOption = $('<option value=' + data[i].id + '>'
														+ data[i].nomeModelo
														+ '</option>');
												$('#modeloSelect').append(
														newOption);
											}
										},
										error : function() {
											alert('Error occured');
										}
									});
						});
	</script>
</body>
</html>