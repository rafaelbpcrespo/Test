class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  validates :uuid, presence: true, uniqueness: true

  def order_in_progress
    self.orders.find_by_uuid(self.uuid)
  end
end
