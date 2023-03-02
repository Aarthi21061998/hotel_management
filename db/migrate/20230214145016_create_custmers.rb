class CreateCustmers < ActiveRecord::Migration[7.0]
  def change
    create_table :custmers do |t|
      t.string :name
      t.string :email_id
      t.integer :phone_num

      t.timestamps
    end
  end
end
