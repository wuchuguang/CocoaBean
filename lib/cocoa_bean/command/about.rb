module CocoaBean
  class Command
    class About < Command
      self.summary = 'Show information about this project'
      self.description = <<-DESC
        This command read and show information from application's 'Beanfile'.
      DESC

      beanfile_required!

      def run
        load beanfile_location
        begin
          puts CocoaBean::Application.only_app
        rescue CocoaBean::Application::ApplicationCountError => e
          warning_and_exit("You should only declare one cocoa bean application.")
        end
      end
    end
  end
end
