class AddVideoUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_url, :string
  end
end
