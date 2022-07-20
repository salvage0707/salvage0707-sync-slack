module SyncSlack
  module SlackApi
    class TeamInfo
      # https://api.slack.com/methods/team.info
      def initialize(response)
        @team = response["team"]
      end

      def uuid
        @team["id"]
      end

      def name
        @team["name"]
      end

      def icon_url
        @team["icon"]["image_44"]
      end
    end
  end
end