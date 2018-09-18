class CreateFavorite < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :language
      t.string :latest_tag
      t.string :url
    end
  end
end
