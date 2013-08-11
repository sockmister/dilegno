class PressRelease < ActiveRecord::Base
  attr_accessible :title, :document

  has_attached_file :document
  validates_attachment_content_type :document, :content_type => [ 'application/pdf']

  has_one :dilegno_image, as: :imageable
end
