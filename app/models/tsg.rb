class Tsg < ActiveRecord::Base
  attr_accessible :department, :name

  has_many :message_records
end
