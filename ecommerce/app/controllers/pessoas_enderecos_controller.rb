class PessoasEnderecosController < ApplicationController

  before_action :set_pessoa_endereco, only: [:edit, :destroy, :update, :show]

  def index
    @pessoas_enderecos = PessoaEndereco.joins(:produto)
  end

  def new
    @pessoa_endereco = PessoaEndereco.new
  end

  def show
  end

  def create
    parametros  = params["pessoa_endereco"]
    pessoa_endereco = PessoaEndereco.new(parametros)

    if pessoa_endereco.save
      redirect_to edit_pessoa_endereco_path(pessoa_endereco), notice: 'Endereço salvo com sucesso!'
    else
      redirect_to new_pessoa_endereco_path, notice: pessoa_endereco.errors.full_messages.join('\n')
    end
  end

  def edit

  end

  def update
    pessoa_endereco =  PessoaEndereco.find(set_pessoa_endereco)

    if pessoa_endereco.update(params[:pessoa_endereco])
      redirect_to edit_pessoa_endereco_path(pessoa_endereco), notice: 'Endereço atualizado com sucesso!'
    else
      redirect_to edit_pessoa_endereco_path, notice: pessoa_endereco.errors.full_messages.join('\n')
    end
  end

  def destroy

    pessoa_endereco = PessoaEndereco.find(set_pessoa_endereco)

    if pessoa_endereco.destroy
      redirect_to pessoas_enderecos_path(pessoa_endereco), notice: 'Endereço apagado com sucesso!'
    end


  end

  def set_pessoa_endereco
    @pessoa_endereco = PessoaEndereco.find(params[:id])
  end
end