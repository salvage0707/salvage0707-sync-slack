class CreateSlackTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_teams do |t|
      t.string :uuid, null: false, comment: "slack teamのuuid"
      t.string :name, null: false, default: "", comment: "slack team名"
      t.string :icon_url, comment: "slack teamのアイコンURL"

      t.timestamps

      t.index :uuid, unique: true
    end
  end
end
