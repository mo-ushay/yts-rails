class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :introduction
      t.string :name
      t.string :abilities
      t.string :password

      t.timestamps
    end
  end
end
