class CreateJoinTableDivisionsCardFields < ActiveRecord::Migration[5.0]
  def change
    create_join_table :divisions, :card_fields do |t|
      # t.index [:division_id, :card_field_id]
      # t.index [:card_field_id, :division_id]
    end
  end
end
