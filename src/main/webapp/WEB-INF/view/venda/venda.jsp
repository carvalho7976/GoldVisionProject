<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Venda Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<h1>Gold Vision</h1>

	<div id="venda-box">

		<h2>Login com usuário e senha</h2>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='vendaForm'
		  action="<c:url value='/venda/save/' />" method='POST'>		  
		  
		  <table>
			<tr>
				<td>Valor de Venda:</td>
				<td><input type='number' name='valorVenda' value=''></td>
			</tr>
			<tr>
				<td>Forma de Pagamento:</td>
				<td><input type='text' name='formaPagamento' /></td>
			</tr>
			<tr>
				<td>Dia de Vencimento:</td>
				<td><input type='number' name='diaVencimento' /></td>
			</tr>
			<tr>
				<td>Numero de Parcelas:</td>
				<td><input type='number' name='numParcelas' /></td>
			</tr>
			<tr>
				<td>Número de Parcelas Pagas:</td>
				<td><input type='number' name='numParcelasPagas' /></td>
			</tr>
			<tr>
				<td>Mês do Ultimo Pagamento:</td>
				<td><input type='number' name='ultimoPagamento' /></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="Enviar" /></td>
			</tr>
		  </table>

		  <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		</form>
	</div>

</body>
</html>