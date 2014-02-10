#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

AptManager::Application.load_tasks


namespace :cloudinary do
  desc "Delete old photos"
  task :delete_old_photos => :environment do
    puts "deleting..."
    BgImage.all.each do |image|    	
    	if image.created_at < 1.month.ago
    		public_id = image.file.model.file.identifier.split("/").last.split(".").first
    		Cloudinary::Uploader.destroy(public_id)
    	end
    end
  end
  puts "done!"
end