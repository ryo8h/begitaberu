class Member < ActiveRecord::Base
  include EmailAddressChecker

  has_many :orders, dependent: :destroy
  has_many :past_orders, dependent: :destroy
  has_one :cart, dependent: :destroy


	validates :user_name, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true,
              message: :invalid_member_name },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :name, length: { maximum: 20 }
  validate :check_email

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


	private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end


end
