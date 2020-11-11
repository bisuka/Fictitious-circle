class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
    	t.integer :user_id
		t.string :title
		t.string :circle
		t.text :activity_content
		t.string :image_id
		t.string :link

        t.timestamps
    end
  end
end
