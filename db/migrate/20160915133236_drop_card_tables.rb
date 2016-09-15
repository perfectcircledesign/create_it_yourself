class DropCardTables < ActiveRecord::Migration[5.0]
  def change
  	drop_table :business_card_fields
  	drop_table :crew_card_fields
  	drop_table :crew_card_fields_divisions
  	drop_table :business_card_fields_divisions
  end
end
