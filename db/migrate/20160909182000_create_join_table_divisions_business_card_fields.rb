class CreateJoinTableDivisionsBusinessCardFields < ActiveRecord::Migration[5.0]
  def change
    create_join_table :divisions, :business_card_fields do |t|
      # t.index [:division_id, :business_card_field_id]
      # t.index [:business_card_field_id, :division_id]
    end
  end
end
