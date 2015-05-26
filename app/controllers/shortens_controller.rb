class ShortensController < ApplicationController
  respond_to :json, :xml

  def create
    @url = Url.new(urls_params)
    if @url.save
      respond_with @url, status: :created, location: expand_path(@url.slug)
    else
      respond_with @url
    end
  end

  def expand
    @url = Url.find_by_slug(params[:slug])
    respond_with @url
  end

  private

  def urls_params
    params.permit(:slug, :url)
  end
end
