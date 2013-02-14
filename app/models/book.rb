class Book < ActiveRecord::Base
  attr_accessible :isbn, :quantity

  validates :isbn, :length => {
    :maximum => 17,
    :minimum => 10
  }
  validates :isbn, :uniqueness => true
  validates :quantity, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  def get_title
     GoogleBooks.search("isbn:#{isbn}", ENV["PROXIMO_URL"].first.title
  end

  def get_author
      GoogleBooks.search("isbn:#{isbn}", ENV["PROXIMO_URL"]).first.authors
  end

  def get_image
    GoogleBooks.search("isbn:#{isbn}", ENV["PROXIMO_URL"]).first.image_link
  end
end
