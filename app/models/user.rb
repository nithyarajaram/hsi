class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :upvotes

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true, :message=>"Please enter a valid email id" 
 
  validates_presence_of :username
  validates_uniqueness_of :username 
  validates_presence_of :password
  validates_presence_of :password_confirmation

 
end
