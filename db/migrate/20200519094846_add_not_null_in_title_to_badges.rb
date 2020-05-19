class AddNotNullInTitleToBadges < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:badges, :title, false)
  end
end
