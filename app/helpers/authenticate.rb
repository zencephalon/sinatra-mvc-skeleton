helpers do
  def logged_in?
    session && session[:user_id]
  end

  def update_session user
    session[:user_id] = user.id
    session[:name] = user.name
  end

  def clear_session
    session[:user_id] = nil
    session[:name] = nil
  end

  def current_user
    return nil unless logged_in?
    User.find(session[:user_id])
  end

  def current_user_locations
    if logged_in?
      Location.where(user_id: current_user.id)
    end
  end

  def user_menu
    erb <<MENU
      <div class='container'>
        <ul class='menu'>
          <li><a href='/'>Home</a></li> <!-- doesnt work when logged in -->
          <% if logged_in? %>
            <li><a href='/logout'>Logout</a></li>
            <li><a href='/users/<%= current_user.id %>'>Profile</a></li>
          <% else %>
            <li><a href='/users/new'>Register</a></li>
            <li><a href='/login'>Login</a></li>
          <% end %>
        </ul>
        <% if @messages && @messages[:alerts] %>
          <ul class='alerts'>
          <% @messages[:alerts].each do |alert| %>
            <li> <%= alert %> </li>
          <% end %>
          </ul>
        <% end %>
        <% if @messages && @messages[:errors] %>
          <ul class='errors'>
          <% @messages[:errors].each do |error| %>
            <li> <%= error %> </li>
          <% end %>
          </ul>
        <% end %>
        <% if logged_in? %>
          <h5>hello <%= "#{session[:name]}" %></h5>
        <% else %>
          <h5>hello guest</h5>
        <% end %>
      </div>
MENU
  end

end
