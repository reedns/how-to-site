class Guide < ActiveRecord::Base
  has_many :steps, dependent: :destroy
end
