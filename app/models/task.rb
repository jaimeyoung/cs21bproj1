class Task < ActiveRecord::Base
	#attr_reader :task, :completed 
	#attr_writer :task, :completed
	#validates :task, presence: true 

	belongs_to :user

	validates :user_id, presence: true
end
