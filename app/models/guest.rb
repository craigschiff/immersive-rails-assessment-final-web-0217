class Guest < ApplicationRecord
  has_many :appearances
  has_many :episodes, through: :appearances

  validates :name, presence: true

  def avg_rating
    total_rating = 0
    total_apps = 0
    self.appearances.each do |app|
      total_rating += app.rating
      total_apps += 1.0
    end
    if total_apps > 0
      total_rating / total_apps
    else
      "No Appearances Yet!"
    end
  end

end
