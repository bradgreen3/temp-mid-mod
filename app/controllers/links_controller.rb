class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # @hot_links = Link.hot
    @links = Link.where(user_id: current_user.id) if current_user
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Updated!"
      redirect_to links_path
    else
      @link.errors.full_messages.each do |message|
        flash[:alert] = message
      end
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

end
