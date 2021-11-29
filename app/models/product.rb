class Product < ApplicationRecord

    validates :sku, presence: true
    validates :title, presence: true, length: {minimum:5, maximum:40}
    validates :price, presence: true
    validates :quantity, presence: true
  
    validates :category, inclusion: { in: %w(Coffee Tea Grindice Others), message: "%{value} is not a valid value" }

    
    def self.fill_out_attr
      products = Product.all
      for product in products
        product[:sku] = "SP1000" + product[:id].to_s
        product[:quantity] = 40
        product.save
      end
    end
    
    def self.search(search)
      if search
        where('title LIKE ?', "%#{search}%")
      else
        all
      end
    end
    def self.filter(tag)
      if tag
        where(category:tag)

      else
        all
      end
    end
    
   

  end
 
 