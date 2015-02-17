module ApplicationHelper
  def options_for_categories
    Category.all.map { |category| [category.name, category.id] }
  end

  def options_for_fields
    Field.all.map { |field| [field.name, field.id] }
  end

  def page_title
    "AdLit - #{content_for(:title)}" if content_for?(:title)
  end

  def refile_file_tag(record, type, style = nil, options = { type: false })
    attributes = get_attributes(record, style) unless style.nil?
    case options[:type]
    when :link
      name = options.fetch(:name, 'file')
      link_to name, attachment_url(record, type)
    when :url
      attachment_url(record, type, attributes[:processor], attributes[:size][0], attributes[:size][1])
    else
      attachment_image_tag(record, type, attributes[:processor], attributes[:size][0], attributes[:size][1], options)
    end
  end

  private

  def get_attributes(record, style)
    {
      member: {
        default:  { size: [300, 300], processor: :fit },
        edit:     { size: [150, 150], processor: :fit }
      },
      news_article: {
        default:  { size: [300, 300], processor: :fit },
        edit:     { size: [150, 150], processor: :fit }
      },
      publication: {
        default:  { size: [300, 300], processor: :fit },
        edit:     { size: [150, 150], processor: :fit }
      }
    }[record.class.name.underscore.to_sym][style.to_sym]
  end
end
