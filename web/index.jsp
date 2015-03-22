<%@page import="br.com.encontreoferta.Voucher"%>
<%@page import="br.com.encontreoferta.VoucherDao"%>
<%@page import="br.com.encontreoferta.Vendedor"%>
<%@page import="br.com.encontreoferta.VendedorDao"%>
<%@page import="br.com.encontreoferta.Categoria"%>
<%@page import="br.com.encontreoferta.CategoriaDao"%>
<%@page import="br.com.encontreoferta.PromocaoDao"%>
<%@page import="java.util.List"%>
<%@page import="br.com.encontreoferta.Promocao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Econtre Oferta</title>
        <style type="text/css">
            table{border-collapse: collapse;}
            th{background-color: green; color: whitesmoke;}
            th, td{padding: 10px;}
            table, th, td{border: 2px solid black}
            a{font-weight: bold; color: green;}
            a:link, a:visited{text-decoration: none;}
            a:hover, a:active{text-decoration: underline;}

        </style>
    </head>
    <body>
        <h1>Encontre Oferta</h1>
        <h2>Categorias:</h2>
        <table>
            <thead>
                <tr>
                    <th>Nome</th><th>Descrição</th><th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    CategoriaDao cd = new CategoriaDao();
                    List<Categoria> categorias = cd.selecionarTodos();
                    if (categorias != null) {
                        for (Categoria categoria : categorias) {
                %>
                <tr>
                    <td><%= categoria.getNome()%></td>
                    <td><%= categoria.getDescricao()%></td>
                    <td><a href="controle?acao=formAlterarCategoria&id=<%= categoria.getIdCategoria()%>">Alterar</a>
                        <a href="controle?acao=excluirCategoria&id=<%= categoria.getIdCategoria()%>">Excluir</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p><a href="controle?acao=formIncluirCategoria">Incluir</a></p>
        <hr>
        <h2>Promoções:</h2>
        <table>
            <thead>
                <tr>
                    <th>Titulo</th><th>Descrição</th><th>Valor</th>
                    <th>Valida Até</th><th>Categoria</th><th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    PromocaoDao pd = new PromocaoDao();
                    List<Promocao> promocoes = pd.selecionarTodos();
                    if (promocoes != null) {
                        for (Promocao promocao : promocoes) {
                %>
                <tr>
                    <td><%= promocao.getTitulo()%></td>
                    <td><%= promocao.getDescricao()%></td>
                    <td><%= promocao.getValor()%></td>
                    <td><%= promocao.getTempo()%></td>
                    <td><%= cd.SelecionarPorId(promocao.getIdCategoria()).getNome()%></td>
                    <td><a href="controle?acao=formAlterarPromocao&id=<%= promocao.getIdPromocao()%>">Alterar</a>
                        <a href="controle?acao=excluirPromocao&id=<%= promocao.getIdPromocao()%>">Excluir</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p><a href="controle?acao=formIncluirPromocao">Incluir</a></p>
        <hr>
        <h2>Vendedores:</h2>
        <table>
            <thead>
                <tr>
                    <th>Nome</th><th>CNPJ</th><th>Descrição</th>
                    <th>Telefone</th><th>Endereço</th><th>Email</th><th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    VendedorDao vd = new VendedorDao();
                    List<Vendedor> vendedores = vd.selecionarTodos();
                    if (vendedores != null) {
                        for (Vendedor vendedor : vendedores) {
                %>
                <tr>
                    <td><%= vendedor.getNomeFantasia()%></td>
                    <td><%= vendedor.getCnpj()%></td>
                    <td><%= vendedor.getDescricao()%></td>
                    <td><%= vendedor.getTelefone()%></td>
                    <td><%= vendedor.getEndereco()%></td>
                    <td><%= vendedor.getEmail()%></td>
                    <td><a href="controle?acao=formAlterarVendedor&cnpj=<%= vendedor.getCnpj()%>">Alterar</a>
                        <a href="controle?acao=excluirVendedor&cnpj=<%= vendedor.getCnpj()%>">Excluir</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p><a href="controle?acao=formIncluirVendedor">Incluir</a></p>
        <hr>
        <h2>Vouchers:</h2>
        <table>
            <thead>
                <tr>
                    <th>Numero do Voucher</th><th>Promoção</th><th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <%
                    VoucherDao vod = new VoucherDao();
                    List<Voucher> vouchers = vod.selecionarTodos();
                    if (vouchers != null) {
                        for (Voucher voucher : vouchers) {
                %>
                <tr>
                    <td><%= voucher.getIdVoucher()%></td>
                    <td><%= pd.selecionarPorId(voucher.getIdPromocao()).getTitulo() %></td>
                    <td><a href="controle?acao=excluirVoucher&numVoucher=<%= voucher.getIdVoucher()%>">Excluir</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p><a href="controle?acao=formIncluirVoucher">Incluir</a></p>
    </body>
</html>
