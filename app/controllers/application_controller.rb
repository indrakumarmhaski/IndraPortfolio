class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContent

    before_action :set_copyright

    def set_copyright
        @copyright = IndraViewTool::Renderer.copyright 'Indra Kumar Mhaski', 'All rights reserved'
    end
end

module IndraViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b> #{name}</b> #{msg}".html_safe
        end
    end
end