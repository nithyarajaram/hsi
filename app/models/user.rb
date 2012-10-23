class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :username, :password, :password_confirmation, :remember_me, :karma

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :upvotes

  before_create :set_karma
  scope :leader_board, order('karma DESC')

  #validates_presence_of :username
  #validates_uniqueness_of :username
  
  def set_karma
    self.karma = 1
  end

end
