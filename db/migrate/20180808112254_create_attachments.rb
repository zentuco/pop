class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.references :design, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
