class Product < ActiveRecord::Base
  attr_accessor :image
  belongs_to :supermarket
  has_many :items
  has_many :orders, through: :items

  has_attached_file :image, path: "public/attachments/:id/image/:style.:extension", url: "/attachments/:id/image/:style.:extension", styles: { medium: "150x150>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :price, :supermarket_id, :image, presence: true
  before_create :titleize_name

  def titleize_name
    self.name = self.name.titleize
  end

  def self.search(search)
    if search
      search = search.titleize
      Product.where('name LIKE ?', "%#{search}%")
    end
  end

end
