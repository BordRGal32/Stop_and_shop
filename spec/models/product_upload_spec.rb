require 'spec_helper'

describe ProductUpload do
  it "creates an instance of ProductUpload and sets the instance variable file to the parameter" do
    pu = ProductUpload.new('file')
    pu.file.should eq 'file'
  end
end
