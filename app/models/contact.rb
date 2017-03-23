class Contact < ActiveRecord::Base
  validates :name, :comments, :email, presence: true
end