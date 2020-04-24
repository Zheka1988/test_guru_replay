class AddBodyToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :body, :text
    change_column_null :answers, :body, false
  end
end
