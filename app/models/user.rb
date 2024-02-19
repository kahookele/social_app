class User < ApplicationRecord
  before_save :capitalize_firstname, :capitalize_lastname, :downcase_email, :capitalize_job_title

  # post association
  has_many :posts, dependent: :destroy

  # image
  has_one_attached :profile_pic
  validates :profile_pic, attached: true

  # firstname validations
  validates :firstname, presence: true, length: { maximum: 50 }

  # lastname validations
  validates :lastname, presence: true, length: { maximum: 50 }

  # email validations
  validates :email, presence: true, uniqueness: true , length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  # password validations
  has_secure_password
  validates :password, length: { minimum: 6 }

  # job_title validations
  validates :job_title, presence: true, length: { maximum: 100 }

  private

  def capitalize_firstname
    self.firstname = firstname.capitalize
  end

  def capitalize_lastname
    self.lastname = lastname.capitalize
  end

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_job_title
    self.job_title = job_title.split(' ').map { |word| word.capitalize }.join(' ')
  end
end
