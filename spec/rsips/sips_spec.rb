require 'spec_helper'

describe Rsips::Sips do
  
  describe "200x160" do
    
    before :each do
      
      # Copy the image to the temp dir, as the tests are destructive on the asset
      # and we want to be able to re-run the tests with the same result
      tmp_img = File.join(temp_path, '200x160.png')
                FileUtils.cp fixture_path('200x160.png'), tmp_img
      @img    = Rsips::Image.new tmp_img
    end
    
    describe "conversion" do
      
      it "should convert to jpeg" do
        Rsips::Image.new(@img.reformat(:jpeg)).format.should == 'jpeg'
      end
      
      it "should convert to png" do
        Rsips::Image.new(@img.reformat(:png)).format.should == 'png'
      end
      
      it "should resample" do
        Rsips::Image.new(@img.resample('Height', '50x50')).height.should == 50
      end
      
    end
    
  end
  
  describe "landscape.tiff" do
    
    before :each do
      
      # Copy the image to the temp dir, as the tests are destructive on the asset
      # and we want to be able to re-run the tests with the same result
      tmp_img = File.join(temp_path, 'landscape.tiff')
                FileUtils.cp fixture_path('landscape.tiff'), tmp_img
      @img    = Rsips::Image.new tmp_img
    end
    
    describe "conversion" do
      
      it "should convert to jpeg" do
        Rsips::Image.new(@img.reformat(:jpeg)).format.should == 'jpeg'
      end
      
      it "should convert to png" do
        Rsips::Image.new(@img.reformat(:png)).format.should == 'png'
      end
      
      it "should resample height" do
        Rsips::Image.new(@img.resample('Height', '100')).height.should == 100
      end
      
    end
    
  end
  
end