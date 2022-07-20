module SyncSlack
  module SlackApi
    class UsersIdentity
      # https://api.slack.com/methods/users.identity
      def initialize(response)
        @user = response["user"]
        @team = response["team"]
      end

      def user_uuid
        @user["id"]
      end

      def username
        @user["name"]
      end

      def email
        @user["email"]
      end

      def team_uuid
        @team["id"]
      end
    end
  end
end