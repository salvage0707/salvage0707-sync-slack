class OmniauthSupport < ActiveType::Object
  class SignInWithSlack < ActiveType::Object
    class << self
      def from_omniauth(auth)
        token = auth["credentials"]["token"]
        client = Slack::Web::Client.new(token: token)

        response = client.users_identity
        identity = ::SyncSlack::SlackApi::UsersIdentity.new(response)

        slack_user = SlackUser.find_by(uuid: identity.user_uuid)
        return slack_user.user if slack_user

        create_user(client, identity)
      end

      private

      # ユーザーを作成
      # @param client [Slack::Web::Client] Slack クライアント
      # @param identity [SyncSlack::SlackApi::UserIdentity] slack user identity
      def create_user(client, identity)
        user = User.create(
          email: identity.email,
          password: Devise.friendly_token[0, 20]
        )
        slack_team = create_slack_team(client)
        create_slack_user(client, identity, slack_team, user)
        user
      end

      # Slackのチームを作成
      # @param client [Slack::Web::Client] Slack クライアント
      def create_slack_team(client)
        response = client.team_info
        team_info = ::SyncSlack::SlackApi::TeamInfo.new(response)
        SlackTeam.find_or_create_by(uuid: team_info.uuid) do |team|
          team.name = team_info.name
          team.icon_url =  team_info.icon_url
        end
      end

      # Slackのユーザーを作成
      # @param client [Slack::Web::Client] Slack クライアント
      # @param identity [SyncSlack::SlackApi::UserIdentity] slack user identity
      # @param slack_team [SlackTeam] slack team
      # @param user [User] user
      def create_slack_user(client, identity, slack_team, user)
        response = client.users_info(user: identity.user_uuid)
        user_info = ::SyncSlack::SlackApi::UsersInfo.new(response)
        SlackUser.find_or_create_by(uuid: user_info.uuid) do |slack_user|
          slack_user.user = user
          slack_user.slack_team = slack_team
          slack_user.username = user_info.display_name
          slack_user.email = identity.email
        end
      end
    end
  end
end
