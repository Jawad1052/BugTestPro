class AddLocationToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :encrypted_location, :string
  end
end
