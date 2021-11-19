class Product < ApplicationRecord

    validates :sku, presence: true
    validates :title, presence: true, length: {minimum:10, maximum:40}
    validates :price, presence: true
    validates :quantity, presence: true
  
    # def self.search(term)
    #   res = []
    #   if term && !term.empty?
    #     res << Product.find_by(title: term)
    #   end
    #   res
    # end
  
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
  end
 
 