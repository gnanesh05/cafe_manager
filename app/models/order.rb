class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def self.of_user(user)
    all.where("user_id = ? and status = ?", user.id, " placed")
  end
end
