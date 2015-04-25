require 'spec_helper'

module Refinery
  module BteGalleries
    describe BteGallery do
      describe "validations" do
        subject do
          FactoryGirl.create(:bte_gallery,
          :caption => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:caption) { should == "Refinery CMS" }
      end
    end
  end
end
