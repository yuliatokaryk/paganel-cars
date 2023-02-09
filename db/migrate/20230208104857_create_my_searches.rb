# frozen_string_literal: true

class CreateMySearches < ActiveRecord::Migration[7.0]
  def change
    create_table :my_searches do |t|
      t.jsonb :search_rules
      t.date :date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
