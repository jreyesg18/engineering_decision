class User < ApplicationRecord
  before_save :adminis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :careers

  validates :identity_document, presence: true
  validates_uniqueness_of :identity_document
  validates :email, format: { with: /@example\.cl\z/i }
  validates :username, length: {in: 3...1000, message: "Must be between 3 characters and 100"}
  validates :name, length: {in: 3...1000, message: "Must be between 3 characters and 100"}
  validates :lastname, length: {in: 3...1000, message: "Must be between 3 characters and 100"}

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
