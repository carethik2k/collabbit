class AttachedFile < ActiveRecord::Base
  include Authority
  
  belongs_to :update, :counter_cache => true
  owned_by :update
  
  has_attached_file :attach,
    :path => ":rails_root/attachments/:instance_id/:id/:basename.:extension",
    :url => "/incidents/:incident_id/updates/:update_id/attachments/:id"
  validates_attachment_size :attach, :less_than => 20.megabytes
  attr_protected :attach_file_name, :attach_content_type, :attach_file_size, :attach_updated_at
end
