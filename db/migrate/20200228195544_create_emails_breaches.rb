class CreateEmailsBreaches < ActiveRecord::Migration[6.0]
  def change
    create_table :emails_breaches do |t|
      t.integer :email_id
      t.integer :breach_id

      t.timestamps
    end
  end
end
