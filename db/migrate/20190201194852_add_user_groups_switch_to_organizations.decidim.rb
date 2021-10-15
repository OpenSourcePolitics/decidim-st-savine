# frozen_string_literal: true

# This migration comes from decidim (originally 20181218171503)

class AddUserGroupsSwitchToOrganizations < ActiveRecord::Migration[5.2]
  def change
    unless column_exists?(:decidim_organizations, :user_groups_enabled)
      add_column :decidim_organizations, :user_groups_enabled, :boolean, null: false, default: false
    end
    execute 'UPDATE decidim_organizations set user_groups_enabled = true'
  end
end
