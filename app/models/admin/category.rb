module Admin
    class Category < ActiveRecord::Base

        has_many :products

        has_attached_file :photo

        validates_attachment_content_type :photo,
            :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

    end
end