<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../fragments/menu.jsp" />

	<div class="container">
		<div role="main" class="col-md-6 col-md-push-3">
			<form:form servletRelativeAction="/cliente/editar/${cliente.id}/"
				method="post" modelAttribute="cliente" class="form-horizontal"
				role="form">

				<fieldset>
					<!-- Form Name -->
					<legend>Editar cliente</legend>

					<!-- Text input-->

					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="nome">Nome</label>
							<div class="col-md-4">
								<input id="nome" name="nome" type="text"
									value="${cliente.nome }" class="form-control input-md" required>
							</div>
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="endereco">Endereço</label>
							<div class="col-md-4">
								<input id="endereco" name="endereco" type="text"
									value="${cliente.endereco}" class="form-control input-md">
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="cpf">CPF</label>
							<div class="col-md-4">
								<input id="cpf" name="cpf" type="text" value="${cliente.cpf }"
									class="form-control input-md" required>
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="rg">RG</label>
							<div class="col-md-4">
								<input id="rg" name="rg" type="text" value="${cliente.rg }"
									class="form-control input-md" required>
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="dataNacs">DataNacs</label>
							<div class="col-md-4">
								<input id="datanacs" name="datanacs" type="text"
									value="${cliente.dataNasc }" class="form-control input-md">
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="naturalidade">Naturalidade</label>
							<div class="col-md-4">
								<input id="naturalidade" name="naturalidade" type="text"
									value="${cliente.naturalidade }" class="form-control input-md">
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="telefone">Telefone</label>
							<div class="col-md-4">
								<input id="telefone" name="telefone" type="text"
									value="${cliente.telefone }" class="form-control input-md">
							</div>
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<div class="row">
							<label class="col-md-4 control-label" for="salvar"></label>
							<div class="col-md-4">
								<button id="salvar" name="salvar" class="btn btn-primary">Salvar</button>
								<a href="<c:url value="/cliente/" ></c:url>">
									<button type="button" class="btn btn-danger">Cancelar</button>
								</a>
							</div>
						</div>
					</div>

				</fieldset>
			</form:form>
		</div>
	</div>
</body>
</html>