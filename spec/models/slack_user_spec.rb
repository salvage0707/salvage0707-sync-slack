# == Schema Information
#
# Table name: slack_users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  image_url(アイコンURL) :string
#  username(slack user名) :string           default(""), not null
#  uuid(slack uuid)       :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slack_team_id          :bigint           not null
#  user_id                :bigint           not null
#
# Indexes
#
#  index_slack_users_on_slack_team_id  (slack_team_id)
#  index_slack_users_on_user_id        (user_id)
#  index_slack_users_on_uuid           (uuid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (slack_team_id => slack_teams.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe SlackUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
