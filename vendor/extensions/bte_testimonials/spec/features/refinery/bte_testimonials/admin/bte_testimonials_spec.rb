# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "BteTestimonials" do
    describe "Admin" do
      describe "bte_testimonials" do
        refinery_login_with :refinery_user

        describe "bte_testimonials list" do
          before do
            FactoryGirl.create(:bte_testimonial, :name => "UniqueTitleOne")
            FactoryGirl.create(:bte_testimonial, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.bte_testimonials_admin_bte_testimonials_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.bte_testimonials_admin_bte_testimonials_path

            click_link "Add New Bte Testimonial"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::BteTestimonials::BteTestimonial.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::BteTestimonials::BteTestimonial.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:bte_testimonial, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.bte_testimonials_admin_bte_testimonials_path

              click_link "Add New Bte Testimonial"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::BteTestimonials::BteTestimonial.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:bte_testimonial, :name => "A name") }

          it "should succeed" do
            visit refinery.bte_testimonials_admin_bte_testimonials_path

            within ".actions" do
              click_link "Edit this bte testimonial"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:bte_testimonial, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.bte_testimonials_admin_bte_testimonials_path

            click_link "Remove this bte testimonial forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::BteTestimonials::BteTestimonial.count.should == 0
          end
        end

      end
    end
  end
end
