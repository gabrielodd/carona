class CreateLocalIntermediarios < ActiveRecord::Migration[5.2]
  def change
    create_table :local_intermediarios do |t|
      t.string :local
      t.references :trajeto, foreign_key: true

      t.timestamps
    end
  end
end
