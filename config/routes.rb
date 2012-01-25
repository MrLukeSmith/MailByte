Rsvp::Application.routes.draw do
  
  root :to => "application#index"
  
  match '/login' => "application#login"
  
  match '/login/process' => "application#process_login"
  
  match '/logout' => "application#logout"
  
  match '/dashboard' => "core#dashboard"
  
end
