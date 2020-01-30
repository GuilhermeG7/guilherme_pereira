class CreateProduto < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :descricao, length: 60, null: false
      t.string :imagem_produto
      t.boolean :ativo, null: false, default: false
      t.boolean :promocao, null: false, default: false
      t.integer :estoque, default: 0, null: false
      t.integer :numero_parcelas, default: 1, null: false
      t.decimal :valor, default: 0, precision: 12, scale: 2
      t.decimal :valor_promocao, precision: 12, scale: 2, default: 0
      t.references :categoria, index: true, null: false

      t.timestamps
    end
  end
end
