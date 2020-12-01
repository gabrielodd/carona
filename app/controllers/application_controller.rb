class ApplicationController < ActionController::Base
    authenticate_with_iduff_keycloak
end
