class PesquisasEnderecosController < ApplicationController
  def index

  end

  def busca_endereco

    nome = params[:nome]
    pesquisa_endereco = PessoaEndereco.where("nome ILIKE ?", "%" + nome + "%").joins(:produto).select("produtos.descricao as produto_descricao, pessoas_enderecos.*").first

    render json: { pesquisa_endereco: pesquisa_endereco }
  end
end