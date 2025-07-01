    class SpaHandler
      def initialize
        @file_handler = ActionDispatch::FileHandler.new(Rails.root.join("public", "react-router", "client").to_s)
      end

      def call(env)
        env["PATH_INFO"] = "index.html" # always serve the index.html
        @file_handler.call(env)
      end
    end
