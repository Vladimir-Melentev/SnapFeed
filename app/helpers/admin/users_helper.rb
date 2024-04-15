module Admin
  module UsersHelper
    #берем ключи enum и для каждой роли генерим массив (для текста и id этой роли)
    def user_roles
      User.roles.keys.map do |role|
        [ role.titleize, role]
      end
    end
  end
end