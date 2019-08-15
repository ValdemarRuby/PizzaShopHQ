class AddProducts < ActiveRecord::Migration[5.2]
  def change
    Product.create :title => 'BBQ', :description => 'This is BBQ pizza', :price => 350, :size => 30, :is_spicy => false, :veg => false, :is_best_offer => false, :path_to_image => '/images/BBQ.jpg'
    Product.create :title => 'Margarita', :description => 'This is Margarita pizza', :price => 300, :size => 30, :is_spicy => false, :veg => false, :is_best_offer => false, :path_to_image => '/images/Margarita.jpg'
    Product.create :title => 'Veg', :description => 'Amazing Veg pizza', :price => 300, :size => 35, :is_spicy => false, :veg => true, :is_best_offer => false, :path_to_image => '/images/Veg.jpeg'
  end
end
