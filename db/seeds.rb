puts 'Cleaning database...'
Teddy.destroy_all
Category.destroy_all

puts 'Creating categories...'
geek = Category.create!(name: 'geek')
kids = Category.create!(name: 'kids')

puts 'Creating teddies...'
Teddy.create!(
  sku: 'original-teddy-bear', 
  name: 'Teddy bear', 
  category: kids, 
  price_cents: 999,
  photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg'
)

Teddy.create!(
  sku: 'jean-mimi', 
  name: 'Jean-Michel - Le Wagon', 
  category: geek,
  price_cents: 499,
  photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large'
)

Teddy.create!(
  sku: 'octocat',   
  name: 'Octocat -  GitHub',      
  category: geek,
  price_cents: 15,
  photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg'
)
puts 'Finished!'

# Use 'puts' for feedback
# Don't assume any ids
# Destroy all at the beginning of the seed
# User 'create!' and 'save!' to make sure the data is valid