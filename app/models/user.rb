class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  acts_as_follower
  acts_as_followable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader
  mount_uploader :avater, AvaterUploader
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :tlks, dependent: :destroy, :foreign_key => :sender_id

  validates_presence_of :name 

  def self.search(search)
    if search
      where(["name Like?","%#{search}%"])
    else
      all 
    end 
  end


  def use_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]


    
end