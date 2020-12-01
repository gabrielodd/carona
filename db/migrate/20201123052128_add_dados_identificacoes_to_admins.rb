class AddDadosIdentificacoesToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :dados_identificacoes_id, :integer
  end
end
