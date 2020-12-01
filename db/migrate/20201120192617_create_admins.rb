class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :nome
      t.boolean :ativo

      t.timestamps
    end
  end
end
