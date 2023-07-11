class User < ApplicationRecord
  before_save :adminis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :careers

  validates_format_of :identity_document , :with => /\A(([0-9]{8})-[a-zA-Z0-9]{1}$)\Z/ , :message => "The format must be 11111111-1"
  validates :identity_document, presence: true, identity_document: true
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
