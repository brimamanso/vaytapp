class Tlk < ApplicationRecord

    belongs_to :sender,  :foreign_key => :sender_id, class_name: 'User'
    belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

    has_many :mls, dependent: :destroy

    validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id,recipient_id) do
    where("(tlks.sender_id = ? AND tlks.recipient_id =?) OR (tlks.sender_id = ? AND tlks.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
  def tlk_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
