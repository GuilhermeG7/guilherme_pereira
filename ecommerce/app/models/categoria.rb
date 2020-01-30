class Categoria < ActiveRecord::Base

  has_many :produtos, dependent: :destroy

  validates_presence_of :descricao, message: " campo não pode ser vazio"
  
end
