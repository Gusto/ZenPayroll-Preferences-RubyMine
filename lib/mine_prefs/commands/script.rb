module MinePrefs
  module Commands
    class Script
      def initialize(commands: [])
        @commands = commands
      end

      def execute
        commands.each &:execute
      end

      private
      attr_reader :commands
    end
  end
end
