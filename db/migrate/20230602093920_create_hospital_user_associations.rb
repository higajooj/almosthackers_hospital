class CreateHospitalUserAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :hospital_user_associations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true
      t.string :role, null: false, default: "pacient"

      t.timestamps
    end
  end
end
