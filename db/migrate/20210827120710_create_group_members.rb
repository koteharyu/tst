class CreateGroupMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_members do |t|
      t.references :group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
