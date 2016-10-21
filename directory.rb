# GET STUFF
get '/' do
	erb :error404; #, :layout => :profile
#    redirect '/feed'
end

get '/display' do
    erb :display_tables; #, :layout => :profile
end

#get '/feed' do
#    erb :feed; #, :layout => :profile
#end

get('/entrance'){ File.read(File.join('public', 'html/entrance.html')) }

get('/register'){ File.read(File.join('public', 'html/register.html')) }

get('/profile'){ File.read(File.join('public', 'html/profile.html')) }

get('/account'){ File.read(File.join('public', 'html/account.html')) }

get('/posts'){ File.read(File.join('public', 'html/posts.html')) }

get('/feed'){ File.read(File.join('public', 'html/feed.html')) }

get('/logout'){
    session.clear
    session[:id] = nil;
    File.read(File.join('public', 'html/logout.html')) 
}

post('/delete'){ 
    User.find(session[:id]).destroy
    File.read(File.join('public', 'html/delete.html')) 
}

post('/delete_all'){
    User.delete_all()
    Post.delete_all()
}

post('/isloggedin'){
    if (session[:id] != nil)
        return nil;
    else
        return "worked";
    end
}


#get '/:name' do
#    erb :error404
#    
#    case params[:name]
#    when "home"
#        erb :error404;
#        
#    when "login"
#        erb :error404;        
#    else
#        erb :error404;
#    end
#    
#end