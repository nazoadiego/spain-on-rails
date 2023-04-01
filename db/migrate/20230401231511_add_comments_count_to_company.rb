class AddCommentsCountToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :comments_count, :integer
  end
end
