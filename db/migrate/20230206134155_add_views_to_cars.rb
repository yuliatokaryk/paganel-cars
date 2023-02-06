class AddViewsToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :views, :integer
  end
end
