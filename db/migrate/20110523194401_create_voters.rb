class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :twitter_id,        :allow_null => false
      t.string :full_name,          :allow_null => false
      t.string :twitter_handle,     :allow_null => false
      t.string :profile_image_url,  :allow_null => false
      t.string :oauth_token,        :allow_null => false
      t.string :oauth_token_secret, :allow_null => false
      t.timestamps
    end
  end
end
