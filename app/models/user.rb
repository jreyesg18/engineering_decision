class User < ApplicationRecord
  before_save :adminis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :careers

  def full_name
     "#{name} #{lastname}"
  end

  def email_com
     "#{email}"
  end

  private
  def adminis
    if email == "admin@example.cl"
      self[:admin] = true
    end
  end

end
