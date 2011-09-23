class Document < ActiveRecord::Base
  belongs_to :project
  mount_uploader :file, DocumentUploader
  
end
