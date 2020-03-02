class CreateBreaches < ActiveRecord::Migration[6.0]
  def change
    create_table :breaches do |t|
      t.string :name
      t.string :title
      t.string :domain
      t.date :breach_date
      t.integer :pwn_count
      t.string :description
      t.string :data_classes
      t.boolean :is_verified
      t.boolean :is_fabricated
      t.boolean :is_retired
      t.boolean :is_spam_list
      t.string :logo_path

      t.timestamps
    end
  end
end
