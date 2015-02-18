class Log < ActiveRecord::Base
   belongs_to :user
   belongs_to :company
   belongs_to :comment
   belongs_to :contract
end
