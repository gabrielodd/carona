class AddIdentificacaoLoginIdToTrajeto < ActiveRecord::Migration[5.2]
  def change
    add_column :trajetos, :identificacao_login_id, :bigint
  end
end
