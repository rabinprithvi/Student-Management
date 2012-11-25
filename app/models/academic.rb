class Academic < ActiveRecord::Base
  attr_accessible :rank, :student_id, :sub1, :sub2, :sub3, :sub4, :sub5, :term, :total
  belongs_to :student
  validates :rank , :total , :presence => true, :length => { :maximum => 3 },:numericality => { :only_integer => true }

  def self.get_by_term(term,clas)
  	arr = []
  	aca = Academic.where(:term => term)

  	aca.each do |a|
  		if(a.student.classroom == clas)
  			arr << a
  		end
  	end
  	arr
  end

end
