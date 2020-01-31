class ProdutosController < ApplicationController

  before_action :set_produto, only: [ :show, :edit, :update]

  def index
    @produtos = Produto.joins(:categoria)
  end

  def show
  end

  def new
    @produto = Produto.new
  end

  def edit

  end

  def create
    imagem = params[:produto][:imagem_produto]
    if imagem
      # Abre o diretório e grava a imagem nele
      File.open(Rails.root.join('app/assets', 'images', imagem.original_filename), 'wb') do |arquivo|
        arquivo.write(imagem.read)
      end
      # subistitui o conteúdo da variavel pelo nome da imagem
      params[:produto][:imagem_produto] = imagem.original_filename
    end

    @produto = Produto.new(params["produto"])

    if @produto.save
      redirect_to edit_produto_path(@produto), notice: 'Produto salvo com sucesso!'
    else
      render new_produto_path
    end
  end

  def update
    imagem = params[:produto][:imagem_produto]
    if imagem
      # Abre o diretório e grava a imagem nele
      File.open(Rails.root.join('app/assets', 'images', imagem.original_filename), 'wb') do |arquivo|
        arquivo.write(imagem.read)
      end
      # subistitui o conteúdo da variavel pelo nome da imagem
      params[:produto][:imagem_produto] = imagem.original_filename
    end
    produto_atualizar = Produto.find(set_produto)

    if produto_atualizar.update(params["produto"])
      redirect_to edit_produto_path(produto_atualizar), notice: 'Produto atualizado com sucesso!'
    else
      redirect_to edit_produto_path, notice: produto_atualizar.errors.full_messages.join('\n')
    end
  end

  def destroy

    produto_apaga = Produto.find(set_produto)

    if produto_apaga.destroy
      redirect_to produtos_path(produto_apaga), notice: 'Produto apagado com sucesso!'
    end

  end
  private

  def set_produto

    @produto = Produto.find(params[:id])
  end

end