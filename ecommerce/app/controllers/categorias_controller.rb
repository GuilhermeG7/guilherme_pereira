class CategoriasController < ApplicationController

  def index
    @categorias = Categoria.all
  end

  def new
    @categoria = Categoria.new
  end

  def create
    parametros  = params["categoria"]
    categoria = Categoria.new(parametros)

    if categoria.save
      redirect_to edit_categoria_path(categoria), notice: 'Categoria salvo com sucesso!'
    else
      redirect_to new_categoria_path, notice: categoria.errors.full_messages.join('\n')
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def update
    categoria =  Categoria.find(params[:id])

    if categoria.update(params[:categoria])
      redirect_to edit_categoria_path(categoria), notice: 'Categroia atualizado com sucesso!'
    else
      redirect_to edit_categoria_path, notice: categoria.errors.full_messages.join('\n')
    end
  end

  def show
    @categoria = Categoria.find(params[:id])
  end

  def destroy

    categoria = Categoria.find(params[:id])

    if categoria.destroy
      redirect_to categorias_path(categoria), notice: 'Categoria apagado com sucesso!'
    end


  end


end