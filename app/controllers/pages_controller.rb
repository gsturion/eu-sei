class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

    def home

    end

    def profile
      @classroom = Classroom.find(1)
    end
end
