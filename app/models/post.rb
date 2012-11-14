class Post < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id

  belongs_to :user
  has_many :comments
  has_many :upvotes, :as => :upvotable
  has_many :downvotes, :as => :downvotable

  before_save :sanitize_url

  validates_presence_of :title
  #validate :url_xor_description

  scope :recent_posts, order('created_at DESC')

  before_save :set_points

  def set_points
    self.points = self.upvotes.count - self.downvotes.count
  end

  private

 # def url_xor_description
  #  if !(url.blank? ^ text.blank?)
   #   errors[:base]<< "Specify a url or description, not both"
    #end
 #
  #end  
     
  def sanitize_url
    if !self.url.empty?
      if self.url.include?('http')
        self.url = url
      else
        self.url = "http\:" + "//" + url
      end
    else
      self.url = ""  
    end
  end  
    
end
