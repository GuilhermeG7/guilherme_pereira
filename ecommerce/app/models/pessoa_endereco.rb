class PessoaEndereco < ActiveRecord::Base

  belongs_to :produto

  validates_presence_of :nome, :rua, :bairro, :cidade, :uf, :cep, :numero, :produto_id, message: " campo não pode ser vazio"

  class << self
    def busca_enderecos nome = ""
      consulta = PessoaEndereco.where("nome ILIKE ?", "%" + nome + "%").order("created_at")
      consulta
    end
  end
end