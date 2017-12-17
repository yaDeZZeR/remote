require 'i18n'

RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.included_models = ["User", "RemoteDevice"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    edit #do  only ["Employee"]  end
    delete #do except ["User", "Call"] end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    config.authenticate_with do
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["ADMIN_LOGIN"] &&
        password == ENV["ADMIN_PASSWORD"]
      end
    end

    config.model 'User' do
      object_label_method :custom_name_method
      edit do
        field :login do
          label "Логин"
        end
        field :password do
          label "Пароль"
        end
        field :ip_address do
          label "IP адрес"
        end
      end
      list do 
        field :login do
          label "Логин"
        end
        field :created_at do
          label "Дата создания"
        end
        field :authentication_token do
          label "Токен"
        end
      end
    end
  end
end
