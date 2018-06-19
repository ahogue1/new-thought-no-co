class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :prayer_requests
  has_many :registrations

  def admin?
    role == "admin"
  end

  def role_enum
    %w(general admin member)
  end

  rails_admin do
    exclude_fields(
      :reset_password_sent_at,
      :remember_created_at,
      :sign_in_count,
      :current_sign_in_ip,
      :created_at,
      :last_sign_in_ip,
      :current_sign_in_at,
      :last_sign_in_at,
      :updated_at,
      :prayer_requests,
      :registrations
    )

    field :role do
      pretty_value { value.capitalize }
    end
  end

end
