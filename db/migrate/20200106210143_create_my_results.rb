class CreateMyResults < ActiveRecord::Migration[6.0]
  def change
    create_table :my_results do |t|
      t.integer :pm
      t.text :result

      t.timestamps
    end
  end
end
