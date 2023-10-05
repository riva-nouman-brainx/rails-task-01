class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :dob
      t.string :email
      t.string :industry_experience

      t.timestamps
    end
  end
end
