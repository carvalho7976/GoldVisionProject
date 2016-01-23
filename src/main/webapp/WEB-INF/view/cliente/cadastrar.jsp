<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<jsp:include page="../fragments/menu.jsp" />

	<h1>Cadastro</h1>
	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>Cadastrar cliente</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="nome">Nome</label>
				<div class="col-md-4">
					<input id="nome" name="nome" type="text" placeholder="placeholder"
						class="form-control input-md" required=""> <span
						class="help-block">help</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="endereco">Endereço</label>
				<div class="col-md-4">
					<input id="endereco" name="endereco" type="text"
						placeholder="placeholder" class="form-control input-md"> <span
						class="help-block">help</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="cpf">CPF</label>
				<div class="col-md-4">
					<input id="cpf" name="cpf" type="text" placeholder="placeholder"
						class="form-control input-md"> <span class="help-block">help</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="rg">RG</label>
				<div class="col-md-4">
					<input id="rg" name="rg" type="text" placeholder="placeholder"
						class="form-control input-md"> <span class="help-block">help</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="datanacs">DataNacs</label>
				<div class="col-md-4">
					<input id="datanacs" name="datanacs" type="text"
						placeholder="placeholder" class="form-control input-md"> <span
						class="help-block">help</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="naturalidade">Naturalidade</label>
				<div class="col-md-4">
					<input id="naturalidade" name="naturalidade" type="text"
						placeholder="placeholder" class="form-control input-md"> <span
						class="help-block">help</span>
				</div>
			</div>

		</fieldset>
	</form>


</body>
</html>