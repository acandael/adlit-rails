class Subscription < ActiveRecord::Base
  validates :email, presence:true, uniqueness: true

  def self.to_csv
    attributes = %w{email}

    CSV.generate(headers: true) do |csv|
      csv << attributes

     all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
     end
    end
  end
end
