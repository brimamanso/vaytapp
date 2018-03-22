class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notified_by,  dependent: :destroy, class_name: 'User'
  belongs_to :post

  validates :user_id, :notified_by_id, :post_id, :notice_type, presence: true

  def notification_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  
end
