class AddUserIdToCareers < ActiveRecord::Migration[5.2]
  def change
    add_column :careers, :user_id, :integer
  end
end
