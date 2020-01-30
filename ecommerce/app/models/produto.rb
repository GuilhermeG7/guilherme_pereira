class Produto < ActiveRecord::Base

  ORDENACAO = {
      (ORDEM_CRIACAO = 'created_at') => 'Ordenação',
      (MENOR_PRECO = 'valor') => 'Menores Valores',
      (MAIOR_PRECO = 'valor DESC') => 'Maiores Valores',
      (ORDEM_CRESCENTE = 'descricao') => 'Ordenar Crescente',
      (ORDEM_DESCRESCENTE = 'descricao DESC') => 'Ordenar Decrescente'
  }

  belongs_to :categoria
  belongs_to :pessoa_endereco

  validates_presence_of :descricao, :estoque, :numero_parcelas, :valor, :categoria, :imagem_produto, message: "campo não pode ser vazio"
  validates_numericality_of :numero_parcelas, :estoque, :valor_promocao, :valor, greater_than_or_equal_to: 0, message: "não é válido"

  validate :valida_numero_parcelas_por_valor
  validate :valida_valor_promocao_marcado_checkbox

  scope :ativos, -> {where(ativo: true)}

  class << self
    def busca_produtos descricao = "", categoria_id = '', ordenacao = nil
      consulta = Produto.ativos.where("descricao ILIKE ?", "%" + descricao + "%").order(ordenacao, "created_at")
      consulta = consulta.where(categoria_id: categoria_id) unless categoria_id.blank?
      consulta
    end
  end
  private
  def valida_numero_parcelas_por_valor
    errors.add :numero_de_parcelas, 'inválidas para o valor informado' if numero_parcelas > 3 && valor <= 200.00
  end

  def valida_valor_promocao_marcado_checkbox
    errors.add :valor_promocao, 'inválido quando promoção marcado' if promocao && valor_promocao <= 1
  end

end
