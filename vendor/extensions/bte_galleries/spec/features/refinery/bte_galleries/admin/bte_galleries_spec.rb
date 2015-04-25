# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "BteGalleries" do
    describe "Admin" do
      describe "bte_galleries" do
        refinery_login_with :refinery_user

        describe "bte_galleries list" do
          before do
            FactoryGirl.create(:bte_gallery, :caption => "UniqueTitleOne")
            FactoryGirl.create(:bte_gallery, :caption => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.bte_galleries_admin_bte_galleries_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.bte_galleries_admin_bte_galleries_path

            click_link "Add New Bte Gallery"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Caption", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::BteGalleries::BteGallery.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Caption can't be blank")
              Refinery::BteGalleries::BteGallery.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:bte_gallery, :caption => "UniqueTitle") }

            it "should fail" do
              visit refinery.bte_galleries_admin_bte_galleries_path

              click_link "Add New Bte Gallery"

              fill_in "Caption", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::BteGalleries::BteGallery.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:bte_gallery, :caption => "A caption") }

          it "should succeed" do
            visit refinery.bte_galleries_admin_bte_galleries_path

            within ".actions" do
              click_link "Edit this bte gallery"
            end

            fill_in "Caption", :with => "A different caption"
            click_button "Save"

            page.should have_content("'A different caption' was successfully updated.")
            page.should have_no_content("A caption")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:bte_gallery, :caption => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.bte_galleries_admin_bte_galleries_path

            click_link "Remove this bte gallery forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::BteGalleries::BteGallery.count.should == 0
          end
        end

      end
    end
  end
end
