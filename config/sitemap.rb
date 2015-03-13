# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.adlit.be"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  NewsArticle.find_each do |article|
    add news_article_path(article), :priority => 0.7, :changefreq => 'weekly'
  end

  Member.find_each do |member|
    add member_path(member), :priority => 0.7, :changefreq => 'monthly'
  end

  add news_path, :priority => 0.5, :changefreq => 'weekly'
  add team_path, :priority => 0.5, :changefreq => 'monthly'
  add output_path, :priority => 0.5, :changefreq => 'monthly'
  add project_path, :priority => 0.5, :changefreq => 'yearly'
  add stakeholders_path, :priority => 0.5, :changefreq => 'yearly'
end
