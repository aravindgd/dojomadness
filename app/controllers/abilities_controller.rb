class AbilitiesController < ApplicationController
  # Mark this as a JSONAPI controller, associating with the given resource
  jsonapi resource: AbilityResource

  # Reference a strong resource payload defined in
  # config/initializers/strong_resources.rb
  strong_resource :ability
  # Run strong parameter validation for these actions.
  # Invalid keys will be dropped.
  # Invalid value types will log or raise based on the configuration
  # ActionController::Parameters.action_on_invalid_parameters
  before_action :apply_strong_params, only: [:create, :update]

  # Start with a base scope and pass to render_jsonapi
  def index
    abilities = Ability.all
    render_jsonapi(abilities)
  end

  # Call jsonapi_scope directly here so we can get behavior like
  # sparse fieldsets and statistics.
  def show
    scope = jsonapi_scope(Ability.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end

  # jsonapi_create will use the configured Resource (and adapter) to persist.
  # This will handle nested relationships as well.
  # On validation errors, render correct error JSON.
  def create
    ability, success = jsonapi_create.to_a

    if success
      render_jsonapi(ability, scope: false)
    else
      render_errors_for(ability)
    end
  end

  # jsonapi_update will use the configured Resource (and adapter) to persist.
  # This will handle nested relationships as well.
  # On validation errors, render correct error JSON.
  def update
    ability, success = jsonapi_update.to_a

    if success
      render_jsonapi(ability, scope: false)
    else
      render_errors_for(ability)
    end
  end

  # No need for any special logic here as no_content is jsonapi_compliant.
  # Customize this if you have a more complex use case.
  def destroy
    ability = Ability.find(params[:id])
    ability.destroy
    return head(:no_content)
  end
end
