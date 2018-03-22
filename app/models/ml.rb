class Ml < ApplicationRecord

    belongs_to :tlk
    belongs_to :user
    validates_presence_of :body, :tlk_id, :user_id

  def ml_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
