class Admin::NewsArticlesController < DashboardController
  before_action :set_news_article, only: [:show, :edit, :update, :destroy]

  def index
    if (category_selected?)
      @news_articles = NewsArticle.filter_by_category(params[:news_article][:news_category]).page(params[:page]).per(10)
      @selected = params[:news_article].try(:[], :news_category)
    else
      @news_articles = NewsArticle.order(created_at: :asc).page(params[:page]).per(10)
    end
  end

  def show
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
  end

  def update
    if @news_article.update(news_article_params)
      redirect_to admin_news_articles_path, notice: "News article successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @news_article.destroy
    redirect_to admin_news_articles_path, notice: "News article successfully deleted!"
  end

  private

  def news_article_params
    params.required(:news_article).permit(:title, :news_category_id, :body, :image, :image_cache_id, :remove_image, :link, :document, :remove_document)
  end

  def set_news_article
    @news_article = NewsArticle.find_by!(slug: params[:id])
  end

  def category_selected?
    params.has_key?(:news_article) && (params[:news_article][:news_category] != "")
  end
end
