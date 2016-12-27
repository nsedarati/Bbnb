class User < ActiveRecord::Base
  include Clearance::User
  validates :fullname, presence: true, length: {maximum: 50}
end
