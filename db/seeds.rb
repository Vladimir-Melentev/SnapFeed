# frozen_string_literal: true

# скрипт для постов
# 30.times do
#   title = Faker::Hipster.sentence(word_count: 3)
#   body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
#   Post.create title: title, body: body
# end

30.times do
  title = Faker::Hipster.word
  Tag.create title: title
end

