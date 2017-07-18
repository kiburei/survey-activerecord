class RenameColumnQuestionId < ActiveRecord::Migration[5.1]
  def up
    change_table :answers do |t|
      t.rename :question_id, :survey_id
  end
  end
end
