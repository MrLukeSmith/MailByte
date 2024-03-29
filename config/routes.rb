MailByte::Application.routes.draw do
  
  root :to => "application#index"
  
  # Legal
  match '/privacy-policy' => "application#privacy_policy"
  
  # Application  
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
  
  # Specific campaign
  match '/campaign/:id' => "campaign#overview"
  match '/campaign/:id/template/new' => "campaign#new_template"
  match '/campaign/:id/template/upload' => "campaign#upload_template"
  match '/campaign/:id/template' => "campaign#template"
  match '/campaign/:id/domain/new' => "campaign#new_domain"  
  match '/campaign/:id/domain/new/process' => "campaign#process_new_domain"  
  match '/campaign/:id/subscribe/form' => "campaign#form_subscribe"
  match '/campaign/:id/subscribe' => "campaign#subscribers"
  
end
