class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :username, :password, :password_confirmation, :remember_me

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :upvotes

  #validates_presence_of :username
  #validates_uniqueness_of :username
  
  protected

  #def email_required?
   #false
  #end

end
