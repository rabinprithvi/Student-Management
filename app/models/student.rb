class Student < ActiveRecord::Base
  attr_accessible :address, :classroom, :dob, :gender, :name, :religion
  has_many :academics, :dependent => :destroy
  validates :name, :address, :presence => true 
end
