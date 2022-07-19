# == Schema Information
#
# Table name: slack_teams
#
#  id                                :bigint           not null, primary key
#  icon_url(slack teamのアイコンURL) :string
#  name(slack team名)                :string           default(""), not null
#  uuid(slack teamのuuid)            :string           not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
# Indexes
#
#  index_slack_teams_on_uuid  (uuid) UNIQUE
#
require 'rails_helper'

RSpec.describe SlackTeam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
