class Categoria < ActiveRecord::Base

  validates_presence_of :descricao, message: ": campo não pode ser vazio"
  
end
