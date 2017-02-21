# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all
Category.destroy_all

3.times do |n|
	Category.create(name:"caca#{n}")
end


Product.create(title: 'prod1', category_id: Category.find_by(name: 'caca0').id, price: 990)
categoria = Category.find_by(name:'caca0')
categoria.products.build(title: 'prod1_build', price: 1090).save


Product.create(title: 'prod2', category_id: Category.find_by(name: 'caca1').id, price: 1190)
categoria = Category.find_by(name:'caca1')
categoria.products.build(title: 'prod2_build', price: 1290).save


Product.create(title: 'prod3', category_id: Category.find_by(name: 'caca2').id, price: 1390)
categoria = Category.find_by(name:'caca2')
categoria.products.build(title: 'prod3_build', price: 1490).save

# Product.last.destroy
p = Product.last
p.destroy

p = Product.last 
p.premium = true
p.save

p = Category.all
p.each do | el |
     el.name.upcase!
     el.save
end

