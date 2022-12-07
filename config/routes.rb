Rails.application.routes.draw do
  resource :characters, only: %i[index show create update destroy]
end
