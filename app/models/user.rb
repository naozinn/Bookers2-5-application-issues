class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :profile_image

  validates :name, presence: true,length: { minimum: 2 , maximum: 20},uniqueness: true
  validates :introduction,length: {  maximum: 50}
  
  def self.search_for(value,how)
    if how == 'perfect'
      User.where(name: value)
    elsif how == 'forward'
      User.where('name LIKE ?', value+'%')
    elsif how == 'backward'
      User.where('name LIKE ?', '%'+value)
    else 
      User.where('name LIKE ?', '%'+value+'%')
    end
  end
end
