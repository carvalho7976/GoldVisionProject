<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-header">
	<h1>
		GVP <small>GoldVision Project</small>
	</h1>
	<div id="custom-bootstrap-menu" class="navbar navbar-default "
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<c:url value='/'/>">Início</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-menubuilder">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse navbar-menubuilder">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="<c:url value='/produto/listar'/>">Produtos</a></li>
					<li><a href="<c:url value='/marca/listar'/>">Marcas</a></li>
					<li><a href="<c:url value='/modelo/listar'/>">Modelos</a></li>
					<li><a href="<c:url value='/cliente/'/>">Clientes</a></li>
					<li><a href="<c:url value='/venda/'/>">Vendas</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/logout" />">Sair <span
							class="glyphicon glyphicon-off"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>