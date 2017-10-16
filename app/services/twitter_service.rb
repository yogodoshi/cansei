# frozen_string_literal: true

class TwitterService
  COMPANY_TWITTER_HANDLE = '@santander_br'

  def initialize(user)
    @user = user
    @client = Twitter::REST::Client.new(@user.twitter_access)
  end

  def tweet_to_the_company
    begin
      @client.update(random_complain_message)
    rescue Twitter::Error::Unauthorized => exception # invalid or expired twitter token
      # do nothing for now
    rescue Twitter::Error::Forbidden => exception
      # do nothing for now
    end
  end

  private

  def random_complain_message
    [
      "#{COMPANY_TWITTER_HANDLE} venho por meio deste tweet mostrar minha insatisfação com o serviço prestado por vocês",
      "#{COMPANY_TWITTER_HANDLE} o atendimento ao consumidor de vocês é péssimo, dá pra melhorar e muito!",
      "#{COMPANY_TWITTER_HANDLE} vocês precisam melhorar o atendimento de vocês, vou continuar a lembra-los disso até que melhorem",
      "#{COMPANY_TWITTER_HANDLE} estou muito insatisfeito com o serviço que vocês prestam",
      "#{COMPANY_TWITTER_HANDLE} demorar dezenas de minutos para ser atendimento no disk santander é um absurdo!",
      "#{COMPANY_TWITTER_HANDLE} a URA de vocês é péssima! Por várias vezes não funciona como deveria, vocês deveriam melhora-la!",
      "#{COMPANY_TWITTER_HANDLE} o serviço/atendimento de vocês é tão ruim que me faz querer fechar minha conta do Santander!",
      "#{COMPANY_TWITTER_HANDLE} quando vocês vão tomar vergonha e prestar um serviço de qualidade aos seus clientes?",
      "Se você está pensando em abrir uma conta no Santander Brasil (#{COMPANY_TWITTER_HANDLE}), pesquise antes aqui no Twitter",
      "#{COMPANY_TWITTER_HANDLE} nenhum canal de atendimento de vocês funciona! Vou avisar pra todo mundo nunca comprar nada com vocês",
      "Ficava me perguntando se só eu que tenho problemas com #{COMPANY_TWITTER_HANDLE} mas foi só pesquisar aqui no Twitter q ficou claro que não",
      "Não aguento mais o #{COMPANY_TWITTER_HANDLE}, nunca mais quero ter conta/comprar nada deles #boicote",
      "Eu já fui mal atendido na vida, mas o #{COMPANY_TWITTER_HANDLE} está de parabéns. É um novo nível de péssimo atendimento",
      "Depois de ser cliente do #{COMPANY_TWITTER_HANDLE} voltei a acreditar em karma. Que atendimento péssimo!",
      "#{COMPANY_TWITTER_HANDLE} por um serviço tão caro vocês deveriam cuidar melhor dos seus clientes",
      "Toda vez que entro em contato com o SAC do #{COMPANY_TWITTER_HANDLE} me sinto como se estivesse pedindo um favor. Não aguento mais!",
      "Nunca coloquei empresa nenhuma na justiça mas o #{COMPANY_TWITTER_HANDLE} está me fazendo mudar de ideia",
      "Acorda #{COMPANY_TWITTER_HANDLE}, o antendimento de vocês é horrível!",
      "#{COMPANY_TWITTER_HANDLE} responder um tweet dias depois não é \"fazer atendimento em mídias sociais\" não, é fingimento",
      "Quer uma dica? Não se torne cliente do #{COMPANY_TWITTER_HANDLE} #ficadica",
      "Passando aqui só pra dizer que ainda odeio o #{COMPANY_TWITTER_HANDLE}",
      "Mais um dia e nada mudou em relação ao atendimento do #{COMPANY_TWITTER_HANDLE}, continua péssimo",
      "Viajar e precisar falar com o #{COMPANY_TWITTER_HANDLE} é o jeito mais rápido de estragar uma viagem",
      "Incrível como mesmo fazendo o mesmo tipo de compra todo mês, o #{COMPANY_TWITTER_HANDLE} ainda bloqueia meu cartão",
      "O que falta pro #{COMPANY_TWITTER_HANDLE} entender que o meu perfil de compra e parar de bloquear o meu cartão?",
      "Mesmo com acesso a todos os meus dados de conta, o #{COMPANY_TWITTER_HANDLE} não consegue resolver o bloqueio do meu cartão",
      "Como um banco do tamanho do #{COMPANY_TWITTER_HANDLE} tem um atendimento por telefone tão ruim?",
      "Seu dia tá bom? Experimente ligar pro #{COMPANY_TWITTER_HANDLE} e ver se você n vai do céu pro inferno rapidinho",
      "Quer uma dica? Não abra conta no #{COMPANY_TWITTER_HANDLE}, sério!",
      "Serviço no Brasil é sempre ruim, mas o do #{COMPANY_TWITTER_HANDLE} consegue ser o pior",
      "Precisa ligar pro #{COMPANY_TWITTER_HANDLE} pra resolver algo? Se prepare pra esperar 20 minutos pra ser atendido",
      "Aquela promessa de resolver tudo pelo app do #{COMPANY_TWITTER_HANDLE} é só promessa mesmo..."
    ].sample
  end
end
