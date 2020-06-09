Rails.application.routes.draw do

  authenticated :user, -> user { user.admin? }  do
    mount DelayedJobWeb, at: "/delayed_job"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount Decidim::Core::Engine => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

end