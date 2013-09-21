get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/start' do

  @deck = Deck.first
  @round = Round.create 
  @card = @deck.cards.first
  
  erb :question
end

get '/signup' do
  erb :sign_up
end

get '/logout' do
  session.clear
  redirect to ('/')
end

get '/:username' do
  if session[:id] 
    @user = User.where(username: params[:username])
    @deck = Deck.first
    @round = Round.create(user_id: session[:id])
    @card = @deck.cards.first

    erb :profile
  else
    redirect to ('/')
  end
end

get '/answer/:category/:id/:roundid' do
  @deck = Deck.find_by_category(params[:category].gsub('%20', ' '))
  @round = Round.find_by_id(params[:roundid]) 
  @card = @deck.cards.first

  erb :question
end


get '/end/:category/:id/:roundid' do
  @round = Round.find_by_id(params[:roundid])
  @user = User.find_by_id(session[:id])
  @deck = Deck.first
  @user_1 = Round.where(user_id: session[:id])

  erb :results
end
#________________post

post '/create_user' do
  username = params[:username]
  email = params[:email]
  password = params[:password]
  @current_user = User.new(username: username, email: email, password: password)
  if @current_user.save
    session[:id] = @current_user.id
    redirect to ("/#{@current_user.username}")
  else
    redirect to ('/')
  end
end

post '/login' do
 username = params[:username]
 password= params[:password]
 @deck = Deck.find_by_id(1)
 @sample = User.find_by_username(params[:username])
   if @sample
    @current_user = User.authenticate(params[:username],params[:password])
      if @current_user
        session[:id]= @current_user.id
        redirect to ("/#{@current_user.username}")
      else
        redirect to ('/')
      end
    else
    redirect to ('/')
  end
end

post '/answer/:category/:id/:roundid' do
 answer = params[:answer]
 category = params[:category]
 card_id = params[:id].to_i - 1
 @deck = Deck.first
 @card = @deck.cards.find_by_id(card_id)
 @round = Round.find_by_id(params[:roundid])
 @actual_answer = Card.find_by_id(card_id)
  if @card.id < @deck.cards.length
     if answer.downcase == @actual_answer.answer.downcase
       @round.score += 1
       @round.save
       @card = Card.find(@card.id += 1)
       erb :question
     else
       @card = Card.find(@card.id += 1)
       @round.save
       erb :question
     end  
  else
    redirect to ("/end/#{category}/#{params[:id]}/#{params[:roundid]}")
  end
end
