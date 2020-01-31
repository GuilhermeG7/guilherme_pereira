class IndexController < ApplicationController

  def index
    @produtos = Produto.busca_produtos
  end

  def busca_principal
    descricao = params[:descricao]
    categoria_id = params[:busca][:categoria_id]
    ordenacao = params[:busca][:ordenacao_consulta]

    @produtos = Produto.busca_produtos descricao, categoria_id, ordenacao
  end

end
