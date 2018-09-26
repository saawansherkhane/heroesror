class Article < ApplicationRecord

  def self.create_article(article_attrs)
    Article.create!(title: article_attrs[:title], question: article_attrs[:question], answer: article_attrs[:answer])
  end

end
