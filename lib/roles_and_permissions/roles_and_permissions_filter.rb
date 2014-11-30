module RolesAndPermissionsFilter

  extend ActiveSupport::Concern
  included do

    before_action :authorize_actor

  end

  FULL_ACCESS_CONTROLLER_ACTIONS = {
    #'controller_name1' => [:all],
    #'controller_name2' => ['action1', 'action2']
  }

  protected

  def authorizable_actor
    current_user
  end

  def check_activated_user_permission
    if !authorizable_actor.has_access_or_control?(controller_name.to_s, action_name.to_s)
      flash.clear
      flash[:error] = 'You are not authorized to access this page Please contact administrator.'
      redirect_to authorization_failure_path
    end
  end

  def authorization_failure_path
    root_path
  end

  def authorize_actor
    return if no_access_required_interface?
    if current_user
      check_activated_user_permission
    else
      flash.clear
      flash[:error] = 'You need to login to access this page.'
      redirect_to new_user_session_path
    end
  end

  def no_access_required_interface?
    FULL_ACCESS_CONTROLLER_ACTIONS.has_key?(controller_name) && (
      FULL_ACCESS_CONTROLLER_ACTIONS[controller_name] == :all ||
      FULL_ACCESS_CONTROLLER_ACTIONS[controller_name].include?(action_name)
    )
  end

end
