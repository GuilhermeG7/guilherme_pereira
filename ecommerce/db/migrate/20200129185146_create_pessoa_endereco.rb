class CreatePessoaEndereco < ActiveRecord::Migration
  def change
    create_table :pessoas_enderecos do |t|
      t.string :nome, length: 60, null: false
      t.string :rua, null: false
      t.string :bairro, null: false
      t.string :cidade, null: false
      t.string :uf, null: false
      t.string :cep, null: false
      t.integer :numero ,null: false

      t.references :produto, index: true
      t.timestamps
    end
  end
end
