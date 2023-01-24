# Use o rails dev:setup (lib/tasks/dev.rake)


=begin
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
    },
    {
        description: "Iota",
        acronym: "IOT",
        url: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"
    },
    {
        description: "ZCash",
        acronym: "ZEC",
        url: "https://z.cash/wp-content/uploads/2018/10/zcash-logo-fullcolor-512sq.png"
    }

]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end
spinner.success("(Concluído!)")
=end
