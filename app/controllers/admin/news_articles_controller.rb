class Admin::NewsArticlesController < DashboardController
  def index
    @news_articles = NewsArticle.order(created_at: :asc)
  end

  def show
    @news_article = NewsArticle.find(params[:id])
  end

  def new
    @news_article = NewsArticle.new
  end

  def create
    @news_article = NewsArticle.create(news_article_params)
    if @news_article.save
      redirect_to admin_news_articles_path, notice: 'The news article was successfully added'
    else
      render :new
    end
  end

  def edit
    @news_article = NewsArticle.find(params[:id])
  end

  def update
    @news_article = NewsArticle.find(params[:id])
    if @news_article.update(news_article_params)
      redirect_to admin_news_articles_path, notice: "News article successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @news_article = NewsArticle.find(params[:id])
    @news_article.destroy
    redirect_to admin_news_articles_path, notice: "News article successfully deleted!"
  end

  private

  def news_article_params
    params.required(:news_article).permit(:title, :body, :image, :remove_image, :link, :document, :remove_document)
  end
end

