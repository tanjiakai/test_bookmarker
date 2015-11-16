class BookmarksController < ApplicationController
  def index
    unless current_user.nil?
      @bookmarks = current_user.bookmarks
    else
      redirect_to new_session_path
    end

  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(url: params[:bookmark][:url], user_id: current_user.id)
    if @bookmark.save
      redirect_to bookmarks_path
    end
  end
end
