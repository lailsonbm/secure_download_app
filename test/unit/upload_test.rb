require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "validation of name" do
    upload = Upload.new
    assert !upload.save
  end
  
  
end
