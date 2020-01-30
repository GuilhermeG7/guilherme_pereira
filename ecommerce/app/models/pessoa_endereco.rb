class PessoaEndereco < ActiveRecord::Base

  belongs_to :produto

  validates_presence_of :nome, :rua, :bairro, :cidade, :uf, :cep, :numero, message: " campo não pode ser vazio"

end