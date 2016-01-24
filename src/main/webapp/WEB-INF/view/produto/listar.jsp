<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar Produtos</title>
<jsp:include page="../fragments/headTag.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/menu.jsp" />
		<div class="nav navbar-nav navbar-right">
			<a href="<c:url value="/produto/adicionar" ></c:url>">
				<button class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span>Adicionar Novo
					Produto
				</button>
			</a>
		</div>

	</div>
</body>
</html>