class CreateTrajetos < ActiveRecord::Migration[5.2]
  def change
    create_table :trajetos do |t|
      t.string :local_partida
      t.string :local_destino
      t.datetime :horario
      t.integer :passageiros
      t.integer :valor
      t.text :observacao

      t.timestamps
    end
  end
end
