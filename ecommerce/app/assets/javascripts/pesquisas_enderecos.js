$(document).ready(function () {
    $("#esconde_mensagem").hide();

   var valor = $("#nome_pessoa").val();

    if (!valor) {
        $('#buscar').attr('disabled', true);

        $('#nome_pessoa').change(function () {
            $("#buscar").removeAttr('disabled');
        })
    }



    $('.buscar_endereco').on('click', function () {

        var nome_pessoa = $("#nome_pessoa").val();

        var interrompe_codigo = campoEndereco(nome_pessoa);

        if (interrompe_codigo) {
            $("#esconde_mensagem").show();
            return false;
        }


        $.ajax({
            url: "/pesquisas_enderecos/busca_endereco",
            data:{
                nome: nome_pessoa,
            },
            success: function (resposta) {

                para_codigo = campoEndereco(resposta.pesquisa_endereco);
                if (para_codigo) {
                    $("#esconde_mensagem").show();
                    return false;
                }

                $("#esconde_mensagem").hide();
                $("#cod_endereco").text(resposta.pesquisa_endereco.id);
                $("#nome_endereco").text(resposta.pesquisa_endereco.nome);
                $("#produto_endereco").text(resposta.pesquisa_endereco.produto_descricao);
                $("#rua_endereco").text(resposta.pesquisa_endereco.rua);
                $("#numero_endereco").text(resposta.pesquisa_endereco.numero);
                $("#bairro_endereco").text(resposta.pesquisa_endereco.bairro);
                $("#cidade_endereco").text(resposta.pesquisa_endereco.cidade);
                $("#uf_endereco").text(resposta.pesquisa_endereco.uf);
                $("#cep_endereco").text(resposta.pesquisa_endereco.cep);

            }
        });
    });

    function campoEndereco(variavel){
        if (!variavel) {
            $("#cod_endereco").text("");
            $("#nome_endereco").text("");
            $("#produto_endereco").text("");
            $("#rua_endereco").text("");
            $("#numero_endereco").text("");
            $("#bairro_endereco").text("");
            $("#cidade_endereco").text("");
            $("#uf_endereco").text("");
            $("#cep_endereco").text("");

            return true
        }
    };

});
