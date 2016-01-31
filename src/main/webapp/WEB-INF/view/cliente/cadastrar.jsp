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
	<div class="container">
		<jsp:include page="../fragments/menu.jsp" />
		<button class="btn btn-default" onclick="history.back();">Voltar</button>

		<form:form servletRelativeAction="/cliente/cadastrar/" method="post"
			modelAttribute="cliente" class="form-horizontal" role="form">

			<fieldset>
				<!-- Form Name -->
				<legend>Cadastrar cliente</legend>

				<!-- Text input-->
			</fieldset>
			<div class="form-group">
				<div class="row">
					<label class="col-sm-2 control-label" for="nome">Nome</label>
					<div class="col-md-8">
						<input id="nome" name="nome" type="text"
							class="form-control input-md" required>
					</div>
				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-2 control-label" for="endereco">Endereço</label>
					<div class="col-md-8">
						<input id="endereco" name="endereco" type="text"
							class="form-control input-md">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-2 control-label" for="cpf">CPF</label>
					<div class="col-md-4">
						<input id="cpf" name="cpf" type="text"
							class="form-control input-md" required>
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-2 control-label" for="rg">RG</label>
					<div class="col-md-4">
						<input id="rg" name="rg" type="text" class="form-control input-md"
							required>
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-2 control-label" for="dataNacs">DataNacs</label>
					<div class="col-md-4">
						<input id="dataNasc" name="dataNasc" type="text"
							class="form-control input-md">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-2 control-label" for="naturalidade">Naturalidade</label>
					<div class="col-md-4">
						<input id="naturalidade" name="naturalidade" type="text"
							class="form-control input-md">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<div class="row">
					<label class="col-md-2 control-label" for="telefone">Telefone</label>
					<div class="col-md-4">
						<input id="telefone" name="telefone" type="text"
							class="form-control input-md">
					</div>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group" align="center">
				<div class="row">
					<label for="salvar"></label>
					<div>
						<button id="salvar" name="salvar" class="btn btn-primary">Salvar</button>
						<a href="<c:url value="/cliente/" ></c:url>">
							<button type="button" class="btn btn-danger">Cancelar</button>
						</a>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>