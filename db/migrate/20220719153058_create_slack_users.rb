class CreateSlackUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_users do |t|
      t.string :uuid, null: false, comment: "slack uuid"
      t.string :username, null: false, default: "", comment: "slack user名"
      t.string :email, null: false, default: "", comment: "メールアドレス"
      t.string :image_url, comment: "アイコンURL"
      t.references :user, null: false, foreign_key: true
      t.references :slack_team, null: false, foreign_key: true

      t.timestamps

      t.index :uuid, unique: true
    end
  end
end
