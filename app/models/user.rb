class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { user: 0, admin: 1 }
  ROLES = User.roles.map { |r,v| [I18n.t("roles.#{r}"), r] }.sort_by { |r| I18n.t("roles.#{r}") }
end
