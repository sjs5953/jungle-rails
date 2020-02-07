class CreatePasswordDigests < ActiveRecord::Migration
  def change
    create_table :password_digests do |t|

      t.timestamps null: false
    end
  end
end
