class Event < ActiveRecord::Base
  
  # Validations
  validates :title, :description, :date_start, :date_end, presence: true
  validates :date_end, date: { :after_or_equal_to => :date_start}
  
  # Relations
  belongs_to :user
  
end
