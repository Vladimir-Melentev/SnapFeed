module PostsComments
  extend ActiveSupport::Concern

  included do

    def load_post_comments(do_render: false)
      @post = @post.decorate
      # если коммента нет, в форме post/show создаем образец класса comment и привязываем его к посту
      @comment ||= @post.comments.build
      # сортируем комментарии для конкретного поста по убыванию
      @pagy, @comments = pagy @post.comments.order(created_at: :desc)
      @comments = @comments.decorate
      render('posts/show') if do_render
    end
  end
end