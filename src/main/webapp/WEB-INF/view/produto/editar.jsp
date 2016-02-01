<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Módulo Produto - Editar</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>
		<form:form servletRelativeAction="/produto/${produto.id}/editar"
			method="post" modelAttribute="produto" class="form-horizontal"
			role="form">
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Editar
					Produto</label>
			</div>

			<div class="form-group">
				<label for="codigo" class="col-sm-1 control-label">Código</label>
				<div class="col-sm-10">
					<form:input id="codigo" class="form-control" path="codigo" />
				</div>
			</div>
			<div class="form-group">
				<label for="quantidade" class="col-sm-1 control-label">Quantidade</label>
				<div class="col-sm-10">
					<form:input id="quantidade" class="form-control" path="quantidade" />
				</div>
			</div>
			<div class="form-group">
				<label for="valorCompra" class="col-sm-1 control-label">Valor
					de Compra</label>
				<div class="col-sm-10">
					<form:input id="valorCompra" class="form-control"
						path="valorCompra" />
				</div>
			</div>
			<div class="form-group">
				<label for="valorVenda" class="col-sm-1 control-label">Valor
					de Venda</label>
				<div class="col-sm-10">
					<form:input id="valorVenda" class="form-control" path="valorVenda" />
				</div>
			</div>

			<div class="form-group">
				<label for="marca" class="col-sm-1 control-label">Marca</label>
					<div class="col-sm-10">
					<form:select id="marcaSelect" class="form-control"
						modelAttribute="produto" placeholder="Marca do Produto"
						path="marca" required="true">
						<form:option value="${produto.marca.id}">${produto.marca.nomeMarca}</form:option>
						<c:forEach items="${listaMarcas}" var="itemMarca">
							<form:option value="${itemMarca.id}">${itemMarca.nomeMarca}</form:option>
						</c:forEach>
						</form:select>
					</div>
			</div>
			<div class="form-group">
				<label for="modelo" class="col-sm-1 control-label">Modelo</label>
				<div class="col-sm-10">
					<form:select path="modelo" id="modeloSelect" modelAttribute="produto"  class="form-control">
						<form:option value="${produto.modelo.id}">${produto.modelo.nomeModelo}</form:option>
					</form:select>
					<form:errors path="modelo" cssClass="error" />
				</div>
			</div>
			<div align="center" class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Atualizar" /> <a
					href="<c:url value="/produto/listar"></c:url>"
					class="btn btn-danger"">Cancelar</a>
			</div>
		</form:form>
	</div>
	<script type="text/javascript">
$('#marcaSelect').change(function() {
    $.ajax({
        type:"GET",
        url : "/GoldVisionProject/produto/getModeloPorMarca",
        data : { marcaId: $('#marcaSelect').val()},
        success : function(data) {
            $('#modeloSelect').empty(); //remove all child nodes
            for(var i = 0; i < data.length; i++){
                var newOption = $('<option value=' + data[i].codigo + '>'+data[i].nomeModelo+'</option>');
                $('#modeloSelect').append(newOption);
            }   
        },
        error: function() {
            alert('Error occured');
        }
    });
});
</script>
</body>
</html>
