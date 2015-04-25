require 'spec_helper'

module Refinery
  module Galleries
    describe Gallery do
      describe "validations" do
        subject do
          FactoryGirl.create(:gallery,
          :caption => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:caption) { should == "Refinery CMS" }
      end
    end
  end
end
