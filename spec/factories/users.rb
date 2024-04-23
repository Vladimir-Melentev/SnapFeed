FactoryBot.define do
  factory :user, class: 'User' do
    name { 'John Doe' } # Устанавливаем фиксированное имя пользователя
    email { FFaker::Internet.safe_email }
    password { 'P@ssword1!' }
    password_confirmation { 'P@ssword1!' }
    old_password { 'P@ssword1!' } # Указываем старый пароль для обновления
  end
end











