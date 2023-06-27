class ProgrammesController < ApplicationController

    def getDetails
        render plain: "#{Programme.find(params[:id]).prix},#{Programme.find(params[:id]).titre}"
    end
end
