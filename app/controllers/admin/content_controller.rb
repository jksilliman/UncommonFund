class Admin::ContentController < Admin::BaseController
  def index
    @items = SiteContent.all
    respond_with(@items)
  end

  def edit
    @item = SiteContent.find(params[:id])
    respond_with(@item)
  end

  def update
    @item = SiteContent.find(params[:id])
    @item.update_attributes(params[:site_content])
    respond_with(@item, :location => admin_content_index_path)
  end
end
