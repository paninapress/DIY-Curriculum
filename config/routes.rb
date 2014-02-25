Diyc::Application.routes.draw do
  root to: "sites#index"
  devise_for :users
  
  get "/browse", to: "courses#browse_all"
  resources :courses do
    resources :sections do
      resources :contents
    end
  end
  
  resources :courses do
    resources :comments
  end
end


#                      Prefix Verb   URI Pattern                                                          Controller#Action
#                        root GET    /                                                                    courses#browse_all
#            new_user_session GET    /users/sign_in(.:format)                                             devise/sessions#new
#                user_session POST   /users/sign_in(.:format)                                             devise/sessions#create
#        destroy_user_session DELETE /users/sign_out(.:format)                                            devise/sessions#destroy
#               user_password POST   /users/password(.:format)                                            devise/passwords#create
#           new_user_password GET    /users/password/new(.:format)                                        devise/passwords#new
#          edit_user_password GET    /users/password/edit(.:format)                                       devise/passwords#edit
#                             PATCH  /users/password(.:format)                                            devise/passwords#update
#                             PUT    /users/password(.:format)                                            devise/passwords#update
#    cancel_user_registration GET    /users/cancel(.:format)                                              devise/registrations#cancel
#           user_registration POST   /users(.:format)                                                     devise/registrations#create
#       new_user_registration GET    /users/sign_up(.:format)                                             devise/registrations#new
#      edit_user_registration GET    /users/edit(.:format)                                                devise/registrations#edit
#                             PATCH  /users(.:format)                                                     devise/registrations#update
#                             PUT    /users(.:format)                                                     devise/registrations#update
#                             DELETE /users(.:format)                                                     devise/registrations#destroy
#                      browse GET    /browse(.:format)                                                    courses#browse_all
#     course_section_contents GET    /courses/:course_id/sections/:section_id/contents(.:format)          contents#index
#                             POST   /courses/:course_id/sections/:section_id/contents(.:format)          contents#create
#  new_course_section_content GET    /courses/:course_id/sections/:section_id/contents/new(.:format)      contents#new
# edit_course_section_content GET    /courses/:course_id/sections/:section_id/contents/:id/edit(.:format) contents#edit
#      course_section_content GET    /courses/:course_id/sections/:section_id/contents/:id(.:format)      contents#show
#                             PATCH  /courses/:course_id/sections/:section_id/contents/:id(.:format)      contents#update
#                             PUT    /courses/:course_id/sections/:section_id/contents/:id(.:format)      contents#update
#                             DELETE /courses/:course_id/sections/:section_id/contents/:id(.:format)      contents#destroy
#             course_sections GET    /courses/:course_id/sections(.:format)                               sections#index
#                             POST   /courses/:course_id/sections(.:format)                               sections#create
#          new_course_section GET    /courses/:course_id/sections/new(.:format)                           sections#new
#         edit_course_section GET    /courses/:course_id/sections/:id/edit(.:format)                      sections#edit
#              course_section GET    /courses/:course_id/sections/:id(.:format)                           sections#show
#                             PATCH  /courses/:course_id/sections/:id(.:format)                           sections#update
#                             PUT    /courses/:course_id/sections/:id(.:format)                           sections#update
#                             DELETE /courses/:course_id/sections/:id(.:format)                           sections#destroy
#                     courses GET    /courses(.:format)                                                   courses#index
#                             POST   /courses(.:format)                                                   courses#create
#                  new_course GET    /courses/new(.:format)                                               courses#new
#                 edit_course GET    /courses/:id/edit(.:format)                                          courses#edit
#                      course GET    /courses/:id(.:format)                                               courses#show
#                             PATCH  /courses/:id(.:format)                                               courses#update
#                             PUT    /courses/:id(.:format)                                               courses#update
#                             DELETE /courses/:id(.:format)                                               courses#destroy


