<%@page import="br.com.encontreoferta.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Vendedor</title>
        <link href="estilos.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%
            Vendedor vendedor = (Vendedor) request.getAttribute("vendedor");
        %>
        <div class="boxBranco">
            <h2>Alterar Vendedor</h2>
            <hr>
            <form method="post" action="controle">
                <input type="hidden" name="acao" value="alterarVendedor" />
                <input type="hidden" name="cnpj" value="<%= vendedor.getCnpj()%>" />
                <p><label>Nome de Usuário: <input type="text" name="usuario" value="<%= vendedor.getLogin()%>" required="true" maxlength="50"></label></p>
                <p><label>Nome Fantasia: <input type="text" name="nome" value="<%= vendedor.getNomeFantasia()%>" required="true" maxlength="50"></label></p>
                <p><label>Descrição: <input type="text" name="descricao" value="<%= vendedor.getDescricao()%>" required="true" maxlength="200"></label></p>
                <p><label>Telefone: <input type="text" name="telefone" value="<%= vendedor.getTelefone()%>" required="true" maxlength="15"></label></p>
                <p><label>Email: <input type="email" name="email" value="<%= vendedor.getEmail()%>" required="true" maxlength="50"></label></p>
                <p><label>Endereço: <input type="text" name="endereco" value="<%= vendedor.getEndereco()%>" required="true" maxlength="50"></label></p>
                <p><input type="submit" value="Alterar"></p>
            </form>
        </div>
    </body>
</html>
