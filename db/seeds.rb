# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    puts 'Creating User'

    User.create!(
      email: 'user@carrinhoemcasa.com',
      password: 'qwertyui',
      password_confirmation: 'qwertyui'
      )


    puts 'Creating CEPs and Supermarkets'
    ["28010-400","27937-270"].each do |cep_code|
      cep = Cep.create(code: cep_code)
      3.times do |i|
        supermarket = cep.supermarkets.create(name: "Supermarket #{i}")
      end
    end

    puts 'Creating Common Products'
    Supermarket.all.each do |supermarket|
      [["arroz", 3.5], ["Feijão", 3], ["refrigerante 2l", 4.69], ["Alcatra Kg", 24.90], ["lasanha 650g", 11], ["macarrão Penne 500g", 2.70], ["Azeite Extra Virgem 500ml", 12.50], ["Desodorante Spray", 10.90], ["Shampoo", 8.59], ["Sabão", 7]].each do |product|
        supermarket.products.create!(name: product[0], price: product[1])
      end
    end

    puts 'Creating Specific Products'
    Supermarket.find(1).products.create(name: "Sabonete", price: 0.99)
    Supermarket.find(1).products.create(name: "Esponja", price: 3.50 )

    Supermarket.find(2).products.create(name: "Picanha KG", price: 45.00)
    Supermarket.find(2).products.create(name: "Leite 1l", price: 2.99)

    Supermarket.find(3).products.create(name: "Presunto", price: 14.55)
    Supermarket.find(3).products.create(name: "Queijo Mussarela", price: 12.89)

    Supermarket.find(4).products.create(name: "Água 1,5l", price: 2.70)
    Supermarket.find(4).products.create(name: "Suco 1l", price: 4.79)

    Supermarket.find(5).products.create(name: "Sal Refinado", price: 3.15)
    Supermarket.find(5).products.create(name: "Farinha", price: 2.20)

    Supermarket.find(6).products.create(name: "Pão Fatiado", price: 5.70)
    Supermarket.find(6).products.create(name: "Bolo", price: 8.79)

