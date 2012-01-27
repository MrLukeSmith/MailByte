MailByte::Application.routes.draw do
  
  root :to => "application#index"
  
  #Application  
  match '/login' => "application#login"  
  match '/login/process' => "application#process_login"  
  match '/logout' => "application#logout"
  
  # Dashboard  
  match '/dashboard' => "core#dashboard"  
  match '/dashboard/readme' => "core#readme"
  
  # External subscriptions for a campaign  
  match '/campaign/in/:id' => "campaign#subscribe"
  
  # Campaign  
  match '/campaign' => "campaign#index"
  match '/campaign/new' => "campaign#new"
  match '/campaign/new/process' => "campaign#new_process"
  match '/campaign/:id' => "campaign#overview"
  

  
end
