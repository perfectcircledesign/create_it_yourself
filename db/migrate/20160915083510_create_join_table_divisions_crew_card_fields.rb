class CreateJoinTableDivisionsCrewCardFields < ActiveRecord::Migration[5.0]
  def change
    create_join_table :divisions, :crew_card_fields do |t|
      # t.index [:division_id, :crew_card_field_id]
      # t.index [:crew_card_field_id, :division_id]
    end
  end
end
