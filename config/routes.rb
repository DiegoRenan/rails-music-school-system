Rails.application.routes.draw do
  get 'sessions/new'
  
  get 'welcome/index'
  
  get 'contrato/index'
   
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  

  resources :funcionarios_turmas 
  resources :salas_turmas
  resources :mensalidades
  resources :configuracaos
  resources :contratos
  resources :modelcons
  
  resources :funcionarios do
    resources :usuarios
  end
  
  resources :matriculas do
    resources :mensalidades
	resources :contratos
  end
  
  resources :alunos do
    resources :matriculas
  end
  
  resources :responsavels do 
    resources :alunos
  end
  
  resources :turmas do
    resources :salas_turmas
    resources :salas
  end
  
  resources :turmas do
    resources :funcionarios
    resources :funcionarios_turmas
  end
  
  resources :salas do
    resources :salas_turmas
    resources :turmas
  end
  
  resources :instituicaos do
    resources :funcionarios  
  end
  
  resources :instituicaos do
    resources :turmas 
  end
  
  resources :funcionarios do
    resources :turmas
    resources :funcionarios_turmas
  end
  
  resources :usuarios
  
  resources :cursos do
    resources :turmas
  end
  
  
  
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
