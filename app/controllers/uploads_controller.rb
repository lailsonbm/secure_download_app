class UploadsController < ApplicationController
  WAIT_TIME = 4
  
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
    
    flash[:notice] = "The file #{upload.name} was uploaded."
    
    redirect_to uploads_path
  end

  def show
    upload = Upload.find(params[:id])
    
    relative_dir_path = File.join("uploads", UUIDTools::UUID.random_create.to_s)
    dir_path = File.join(RAILS_ROOT, "public", relative_dir_path)
    FileUtils.mkdir(dir_path)
    
    relative_download_path = File.join(relative_dir_path, upload.name)
    download_path = File.join(RAILS_ROOT, "public", relative_download_path)
    FileUtils.ln_s(upload.path, download_path)
    
    Thread.new do
      sleep WAIT_TIME
      FileUtils.remove_dir dir_path
      puts "Removed directory #{dir_path}"
    end
    
    redirect_to File.join("/", relative_download_path)
  end

  def destroy
    upload = Upload.find(params[:id])
    upload.destroy
    
    flash[:notice] = "The file #{upload.name} was deleted."
    
    redirect_to uploads_path
  end
  
end
