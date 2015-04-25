# This migration comes from refinery_bte_testimonials (originally 1)
class CreateBteTestimonialsBteTestimonials < ActiveRecord::Migration

  def up
    create_table :refinery_bte_testimonials do |t|
      t.string :name
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bte_testimonials"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bte_testimonials/bte_testimonials"})
    end

    drop_table :refinery_bte_testimonials

  end

end
