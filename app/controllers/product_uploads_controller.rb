class ProductUploadsController < ApplicationController
  def new
    @product_upload = ProductUpload.new
  end

  def create
    ProductUpload.new(params[:product_upload][:csv].tempfile).parse!
    redirect_to root_path
  end
end
