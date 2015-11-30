Rottenpotatoes::Application.routes.draw do
  resources :movies
  get "movies/:id/similars", to: 'movies#similars'
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
