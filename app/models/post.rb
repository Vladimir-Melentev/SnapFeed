class Post < ApplicationRecord
                      #Позволит удалить пост вместе с комментариями
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    self.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
