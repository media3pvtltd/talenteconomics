# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Researches" do
    describe "Admin" do
      describe "researches" do
        refinery_login_with :refinery_user

        describe "researches list" do
          before do
            FactoryGirl.create(:research, :title => "UniqueTitleOne")
            FactoryGirl.create(:research, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.researches_admin_researches_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.researches_admin_researches_path

            click_link "Add New Research"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Researches::Research.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Researches::Research.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:research, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.researches_admin_researches_path

              click_link "Add New Research"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Researches::Research.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:research, :title => "A title") }

          it "should succeed" do
            visit refinery.researches_admin_researches_path

            within ".actions" do
              click_link "Edit this research"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:research, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.researches_admin_researches_path

            click_link "Remove this research forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Researches::Research.count.should == 0
          end
        end

      end
    end
  end
end
