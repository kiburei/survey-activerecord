class CreateSurvey < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|
      t.column(:question, :string)
    end
  end
end
