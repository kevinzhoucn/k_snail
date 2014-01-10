class MessageRecord < ActiveRecord::Base
	HISTORY = 20
  	attr_accessible :title, :tsg_id, :type_id

  	belongs_to :tsg

#  	scope :recent, where(:all).reverse_order.limit(HISTORY)
	scope :recent, order('id desc').limit(10)
end
