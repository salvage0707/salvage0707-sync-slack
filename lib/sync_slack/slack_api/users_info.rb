module SyncSlack
  module SlackApi
    class UsersInfo
      # https://api.slack.com/methods/user.info
      def initialize(response)
        @user = response["user"]
        @profile = response["user"]["profile"]
      end

      def uuid
        @user["id"]
      end

      def display_name
        @profile["display_name"]
      end

      def email
        @profile["email"]
      end

      def icon_url
        @profile["icon"]["image_48"]
      end
    end
  end
end