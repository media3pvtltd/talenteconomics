class CreateProfilesProfiles < ActiveRecord::Migration

  def up
    create_table :refinery_profiles do |t|
      t.string :name
      t.string :location
      t.datetime :certification_date
      t.string :email
      t.text :content
      t.integer :picture_id
      t.string :google_profile
      t.string :facebook_profile
      t.string :twitter_profile
      t.string :linkedin_profile
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-profiles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/profiles/profiles"})
    end

    drop_table :refinery_profiles

  end

end
