class AddCidadeToCampusUff < ActiveRecord::Migration[5.2]
  def change
    add_column :campus_uffs, :cidade, :string
  end
end
