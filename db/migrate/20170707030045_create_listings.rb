
class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user 
      t.string :property_type 
      t.string :description
      t.integer :price
    
      t.timestamps
    end
  end
end
