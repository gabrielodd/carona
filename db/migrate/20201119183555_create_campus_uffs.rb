class CreateCampusUffs < ActiveRecord::Migration[5.2]
  def change
    create_table :campus_uffs do |t|
      t.string :nome
      t.string :endereco
      t.string :numero
      t.string :bairro
      t.string :cep

      t.timestamps
    end
  end
end
