class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

    def home

    end

    def profile
      @classroom = Classroom.find(classroom_params)
    end

    private

    def classroom_params
      params.require(:classroom).permit(:id)
    end
end
