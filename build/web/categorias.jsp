<%@page import="br.com.encontreoferta.Vendedor"%>
<%@page import="br.com.encontreoferta.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="br.com.encontreoferta.CategoriaService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        <link href="estilos.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%            Vendedor vendedor = null;
            if (session.getAttribute("vendedor") != null) {
                vendedor = (Vendedor) session.getAttribute("vendedor");
            }
        %>
        <!-- Lista todas as categorias -->
        <div class="boxBranco">
            <h2>Categorias:</h2>
            <%
                if (request.getAttribute("error") != null) {
            %>
            <div class="alertaErro">
                <%= request.getAttribute("error")%>
            </div>
            <%
                }
            %>
            <hr>
            <table>
                <thead>
                    <tr>
                        <th>Nome</th><th>Descrição</th><th width="70">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        CategoriaService categoriaService = new CategoriaService();
                        List<Categoria> categorias = categoriaService.selecionarTodos();
                        if (categorias != null) {
                            for (Categoria categoria : categorias) {
                    %>
                    <tr>
                        <td>
                            <a href="controle?acao=verPromocoesPorCategoria&id=<%= categoria.getIdCategoria()%>">
                                <%= categoria.getNome()%>
                            </a>
                        </td>
                        <td><%= categoria.getDescricao()%></td>
                        <td align="center">
                            <%
                                if (vendedor != null) {
                            %>
                            <a href="controle?acao=formAlterarCategoria&id=<%= categoria.getIdCategoria()%>">
                                <image src="imagens/editar.png" width="20" heigh="20">
                            </a>
                            <a href="controle?acao=excluirCategoria&id=<%= categoria.getIdCategoria()%>">
                                <image src="imagens/apagar.png" width="20" heigh="20">
                            </a>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <%
                if (vendedor != null) {
            %>
            <p><a href="controle?acao=formIncluirCategoria">Incluir categoria</a></p>
            <%
                }
            %>
        </div>
    </body>
</html>
