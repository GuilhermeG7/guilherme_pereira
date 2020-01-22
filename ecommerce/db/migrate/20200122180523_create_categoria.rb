class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
