class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :room, null: false, foreign_key: true
      t.string :user
      t.string :content

      t.timestamps
    end
  end
end
