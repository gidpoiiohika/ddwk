class CreatePuppies < ActiveRecord::Migration[6.0]
  def change
    create_table :puppies do |t|
      t.text :name
      t.text :descriptin
      t.string :date_of_birth

      t.timestamps
    end
  end
end
