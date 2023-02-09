# frozen_string_literal: true

class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.jsonb :search_rules
      t.integer :requests_quantity
      t.integer :total_quantity

      t.timestamps
    end
  end
end
