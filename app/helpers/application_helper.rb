# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_avatar(user, options={})
    gravatar_for user, options.reverse_merge(:alt => 'Avatar', :default => '/images/Users.png')
  end
  
  def link_to_gravatar
    link_to 'Gravatar', "http://gravatar.com"
  end

  def link_to_gravatar_sign_up
    link_to "Obtenha seu gravatar agora", "http://gravatar.com/signup"
  end
  
end
