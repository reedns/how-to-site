class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :title
    end
  end
end
