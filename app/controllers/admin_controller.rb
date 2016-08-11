class AdminController < ApplicationController
    def dashboard
        if not current_user
            redirect_to :root
        elsif current_user.position != 'admin'
            redirect_to :client_dashboard
        end
    end
end
