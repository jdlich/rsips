require 'spec_helper'

describe Rsips::Image do
  
  describe "200x160.png" do
    
    before(:each) do
      @img = Rsips::Image.new fixture_path('200x160.png')
    end
    
    describe "properties" do

      it "should say orientation is vertical" do
        @img.orientation.should == 'vertical'
      end

      it "should be vertical" do
        @img.should be_vertical
      end
      
      it "should be in RGB colour space" do
        @img.space.should == 'RGB'
      end
      
      it "should have png as format" do
        @img.format.should == 'png'
      end
      
      it "should have height of 200" do
        @img.height.should == 200
      end

      it "should have width of 160" do
        @img.width.should == 160
      end
    end
    
  end
  
  describe "landscape.tiff" do
    
    before(:each) do
      @img = Rsips::Image.new fixture_path('landscape.tiff')
    end
    
    describe "properties" do

      it "should say orientation is horizontal" do
        @img.orientation.should == 'horizontal'
      end

      it "should not be vertical" do
        @img.should_not be_vertical
      end
      
      it "should be in RGB colour space" do
        @img.space.should == 'RGB'
      end
      
      it "should have tiff as format" do
        @img.format.should == 'tiff'
      end
      
      it "should have height of 100" do
        @img.height.should == 100
      end

      it "should have width of 750" do
        @img.width.should == 750
      end
    end
    
  end
  
end