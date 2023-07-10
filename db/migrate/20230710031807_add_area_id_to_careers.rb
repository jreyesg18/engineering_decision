class AddAreaIdToCareers < ActiveRecord::Migration[5.2]
  def change
    add_column :careers, :area_id, :integer
  end
end
