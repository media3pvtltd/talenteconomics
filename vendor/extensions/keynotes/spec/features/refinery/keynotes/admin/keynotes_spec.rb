# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Keynotes" do
    describe "Admin" do
      describe "keynotes" do
        refinery_login_with :refinery_user

        describe "keynotes list" do
          before do
            FactoryGirl.create(:keynote, :title => "UniqueTitleOne")
            FactoryGirl.create(:keynote, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.keynotes_admin_keynotes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.keynotes_admin_keynotes_path

            click_link "Add New Keynote"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Keynotes::Keynote.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Keynotes::Keynote.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:keynote, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.keynotes_admin_keynotes_path

              click_link "Add New Keynote"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Keynotes::Keynote.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:keynote, :title => "A title") }

          it "should succeed" do
            visit refinery.keynotes_admin_keynotes_path

            within ".actions" do
              click_link "Edit this keynote"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:keynote, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.keynotes_admin_keynotes_path

            click_link "Remove this keynote forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Keynotes::Keynote.count.should == 0
          end
        end

      end
    end
  end
end
