class LinksController < ApplicationController
  def index
    @hot_links = Link.hot
    @links = Link.where(user_id: current_user.id) if current_user
  end
end
