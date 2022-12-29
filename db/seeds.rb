# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
    spinner.auto_spin

coins = [
    {   
        description: "Bitcoin",
        acronym: "BTC",
        url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL5GCGNfIIdjPthShVRhI4YQDyvRAuEGmbB_8hewUqXk9IeYaHw9SHm31K_3fl8CL8QkU&usqp=CAU"
    },
    {   
        description: "Ethereum",
        acronym: "ETH",
        url: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png"
    },
    {
        description: "Dash",
        acronym: "DASH",
        url: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
    }
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end
spinner.success("(Concluído!)")