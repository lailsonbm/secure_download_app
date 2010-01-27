class UploadsController < ApplicationController
  def index
    if request.path == "/"
      redirect_to uploads_path
    end
    
    @uploads = Upload.all
  end

  def new
  end

  def create
    upload = Upload.new
    upload.name = params[:upload].original_filename
    upload.content_type = params[:upload].content_type
    upload.path = File.join(RAILS_ROOT, "db", "uploads", "#{Time.now.to_i}#{rand(1000)}")
    
    File.open(upload.path, "w") do |file|
      file.write params[:upload].read
    end
    params[:upload].close
    
    upload.save
    
    redirect_to :action => :index
  end

  def show
    
  end

  def delete
  end
  
end
