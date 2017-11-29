require 'jsonapi_swagger_helpers'

class DocsController < ActionController::API
  include JsonapiSwaggerHelpers::DocsControllerMixin

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Overwatch'
      key :description, 'API that provides information about Overwatch heroes and their abilities'
      contact do
        key :name, 'Aravind'
        key :email, 'pro.aravind@gmail.com'
      end
    end
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end
end
