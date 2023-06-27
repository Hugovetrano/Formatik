class SessionsController < ApplicationController
    before_action :redirect_unlogged_user

    def new
        @session = Session.new
    end

    private

    def redirect_unlogged_user
        unless current_user
            redirect_to root_path
        end
    end
end
