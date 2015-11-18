class Product < ActiveRecord::Base
  belongs_to :supermarket
  has_many :items
  has_many :orders, through: :items

  validates :name, :price, :supermarket_id, presence: true
  before_create :titleize_name

  def titleize_name
    self.name = self.name.titleize
    self.save!
  end

  def self.search(search)
    if search
      search = search.titleize
      find(:all, :conditions => ['nome LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
