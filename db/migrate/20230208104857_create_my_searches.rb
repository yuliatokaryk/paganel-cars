class CreateMySearches < ActiveRecord::Migration[7.0]
  enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    create_table :my_searches do |t|
      t.hstore :search_rules
      t.date :date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
