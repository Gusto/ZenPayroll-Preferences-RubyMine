require "mine_prefs/values/backup_pathname"

module MinePrefs
  module Commands
    class Backup
      def initialize(filesystem: MinePrefs::FileUtils.new, files_to_install: [])
        @filesystem = filesystem
        @files_to_install = files_to_install
      end

      def execute
        files_to_install.each do |file|
          source = file.target
          destination = Values::BackupPathname.new(source)

          filesystem.mv(source, destination)
        end
      end

      private
      attr_reader(
        :files_to_install,
        :filesystem,
      )
    end
  end
end
