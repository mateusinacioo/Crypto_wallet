namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") {%x(rails db:create)}
      show_spinner("Migrando BD...") {%x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      else 
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
    task add_coins: :environment do
      show_spinner("Cadastrando tipos de mineração...") do
        coins = [
                  {   
                      description: "Bitcoin",
                      acronym: "BTC",
                      url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL5GCGNfIIdjPthShVRhI4YQDyvRAuEGmbB_8hewUqXk9IeYaHw9SHm31K_3fl8CL8QkU&usqp=CAU",
                      mining_type: MiningType.find_by(acronym: 'PoW')
                  },
                  {   
                      description: "Ethereum",
                      acronym: "ETH",
                      url: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png",
                      mining_type: MiningType.all.sample
                  },
                  {
                      description: "Dash",
                      acronym: "DASH",
                      url: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
                      mining_type: MiningType.all.sample
                  },
                  {
                      description: "Iota",
                      acronym: "IOT",
                      url: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
                      mining_type: MiningType.all.sample
                  },
                  {
                      description: "ZCash",
                      acronym: "ZEC",
                      url: "https://z.cash/wp-content/uploads/2018/10/zcash-logo-fullcolor-512sq.png",
                      mining_type: MiningType.all.sample
                  }

                ]

            coins.each do |coin|
                Coin.find_or_create_by!(coin)
            end
          end
        end

      desc "Cadastra de tipos de mineração"
        task add_mining_types: :environment do
          show_spinner("Cadastrando moedas...") do
            mining_types =[
              {descryption: "Proof of Work", acronym: "PoW"},
              {descryption: "Proof of Stake", acronym: "PoS"},
              {descryption: "Proof of Capacity", acronym: "PoC"}
            ]
            mining_types.each do |mining_type|
              MiningType.find_or_create_by!(mining_type)
          end
        end
      end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
      yield
    spinner.success("(#{msg_end})")
  end
end
