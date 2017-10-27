[![Build Status](https://travis-ci.org/yogodoshi/cansei.svg?branch=master)](https://travis-ci.org/yogodoshi/cansei)


# Cansei

A idéia deste projeto surgiu após eu [yogodoshi](https://twitter.com/yogodoshi) estar de saco cheio de perder dezenas de horas da minha vida por causa do péssimo serviço e atendimento do Santander.

Eu queria poder mostra-los o quão insatisfeito eu estou mas somente eu twittando diariamente não seria o suficiente, porém, se mais pessoas fizessem o mesmo, aí sim acredito que as coisas poderiam começar a mudar!

Que tal "um app que twitte frequentemente a nossa insatisfação com a empresa"? Ele atingiria 2 objetivos:

1. fazer com que outras pessoas saibam o quão péssimo é o serviço/atendimento prestado pela empresas, através das mídias sociais;
2. mostrar as empresas como estamos frustrados/revoltados/de saco cheio de sermos maltratados;

Mas da mesma forma que eu estou cansado de ser maltratado pelo Santander, outras pessoas certamente passam pelo mesmo problema com outras empresas... e nem todos são programadores... :thinking_face:

:boom: surgiu a idéia de criar este app como um projeto open source durante para que outras pessoas possam utiliza-lo contra as empresas que preferirem :thumbsup:


# Dependências

- terminal/linha de comando
- Git
  - MacOS: `$ brew install git`


# Como usar o projeto

### 1. Clonar o repositório

No terminal rode `$ git clone git@github.com:yogodoshi/cansei.git` e depois `$ cd cansei` para entrar na pasta.


### 2. Configurações do app

Abra o arquivo `cansei/config/settings.yml` e altere os valores de cada chave. Os valores atuais são auto-explicativos.

Adicione pelo menos uns 10 tweets diferentes para ter uma boa variedade de mensagens, afinal, terão pessoas twittando diariamente estas mensagens.


### 3. Configurações da integração com o Twitter

Para poder twittar em nome das pessoas, você precisa criar um app junto ao Twitter. Vamos ao passo-a-passo:

1. Entre em [https://apps.twitter.com/app/new](https://apps.twitter.com/app/new)
2. Preencha "name" com o nome do site, pode ser algo como "Cansei do péssimo atendimento do Santander".
3. Em "description" preencha uma breve explicação do app, algo como "Reclamaremos junto ao Santander semanalmente, diariamente ou de hora-em-hora em seu nome!"
4. Em "website" preencha a url do seu domínio ou caso não tenha, preencha com o seu twitter mesmo. Você poderá alterar aqui depois
5. O campo "callback url" você pode deixar em branco
6. Marque que você concorda com as regras e clique em "submit".
7. Clique na aba "Keys and Access Tokens", onde você verá 2 importantes chaves "Consumer Key (API Key)" e "Consumer Secret (API Secret)". Você as usará no passo seguinte


### 4. Deploy para o Heroku

Esse passo é opcional, você pode usar o host de sua preferência. Estamos sugerindo o Heroku por ter um plano gratuito e ser bem prático.

1. Crie uma conta no [Heroku](https://heroku.com)
2. Entre na página de [criação de uma nova app](https://dashboard.heroku.com/new-app), preencha "app name" com a URL que você deseja para o seu site. Exemplo: "canseidosantander" irá se tornar `http://canseidosantander.herokuapp.com` caso você não deseje utilizar um domínio próprio como `canseidosantander.com.br`, por exemplo.
3. Você estará na aba "deploy", siga os passos da seção "Existing Git repository".
4. Clique na aba "Settings", depois em "Reveal config vars"
5. Você criará as seguintes variáveis: `TWITTER_API_KEY` e `TWITTER_API_SECRET`, em seus respectivos valores, você preencherá com as chaves encontradas na aplicação que criou junto ao twitter, no passo anterior.
6. Volte ao terminal e rode `$ git push heroku` para subir a aplicação para o heroku
7. Após o deploy ter sido finalizado com sucesso, rode `$ heroku run rake db:migrate` para fazer o setup do banco de dados e pronto! Seu app está pronto para ser utilizado!


### 5. Teste por uns dias

Se você não for um programador Ruby ou não estiver acostumado com aplicações web, sugiro ser o primeiro a testar o app. Deixe que o app twitte em suas conta do twitter por uns dias, veja se as mensagens que você adicionou fazem sentido no contexto do Twitter, etc.

Qualquer dúvida, [crie uma issue](https://github.com/yogodoshi/cansei/issues) no repositório que iremos lhe ajudar :)


# Dependências (caso queira modificar o site além do tutorial ou rodar o projeto localmente)

- Ruby 2.4 (we suggest using [RVM](http://rvm.io))
- [PostgreSQL](http://www.postgresql.org/)
  - OSX - `$ brew install postgresql` or [Postgres.app](http://postgresapp.com/)
  - Linux - `$ sudo apt-get install postgresql`
  - Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)
