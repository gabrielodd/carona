class AddDataDesativacaoToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :data_desativacao, :datetime
  end
end
