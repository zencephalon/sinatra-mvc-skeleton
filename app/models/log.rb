class Log < ActiveRecord::Base
   has_one :user
   has_one :maker, :class_name => 'Company'
   has_one :taker, :class_name => 'Company'
   has_one :comment
end
