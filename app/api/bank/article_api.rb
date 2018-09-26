module Bank
  class ArticleAPI < Grape::API

    resource :articles do

      desc 'Create an Article.'
      params do
        requires :title, type: String, desc: 'Your title.'
        requires :question, type: String, desc: 'Your question.'
        requires :answer, type: String, desc: 'Your answer.'
      end
      post '/create'do
        Article.create_article(params)
      end

    end

  end
end