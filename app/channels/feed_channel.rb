class FeedChannel < ApplicationCable::Channel
  def subscribed
    feed = Classroom.find(params[:id])
    stream_from "feed"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
