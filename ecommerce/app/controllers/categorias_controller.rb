class CategoriasController < ApplicationController
  def index
  end

  def new
    @categoria = Categoria.new
  end

  def create
    parametros  = params["categoria"]
    categoria = Categoria.create(parametros)

    if categoria.save
      redirect_to edit_categorias_path( id: categoria.id ), notice: 'Produto salvo com sucesso!'
    else
      redirect_to new_categorias_path, notice: categoria.errors.full_messages.join('\n')

    end


  end

  def edit

  end


end