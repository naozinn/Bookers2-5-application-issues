class Book < ApplicationRecord

  belongs_to :user
  # has_many :post_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true,length: {  maximum: 200}

  def self.search_for(value,how)
    if how == 'perfect'
      Book.where(title: value)
    elsif how == 'forward'
      Book.where('title LIKE ?', value+'%')
    elsif how == 'backward'
      Book.where('title LIKE ?', '%'+value)
    else
      Book.where('title LIKE ?', '%'+value+'%')
    end
  end
end
