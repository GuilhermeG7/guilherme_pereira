class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :status
      t.references :zombies, index: true

      t.timestamps
    end
  end
end
