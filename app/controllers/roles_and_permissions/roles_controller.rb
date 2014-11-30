class RolesAndPermissions::RolesController < ApplicationController

  def index
    @roles = Role.includes(:saved_by, :permission).order('updated_at desc')
  end

  def new
    @role = Role.new
  end

  def create
    role = Role.create(role_params)
    if role.errors.any?
      flash[:error] = 'Role could not be created.'
      render 'new'
    else
      flash[:notice] = "Role : '#{role.name}' created successfully."
      redirect_to roles_path
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    role = Role.find(params[:id])
    if role.update(role_params)
      flash[:notice] = "Role : '#{role.name}' updated successfully."
      redirect_to roles_path
    else
      flash[:error] = 'Role could not be updated.'
      render 'edit'
    end
  end

  def toggle_status
    role = Role.find(params[:id])
    role.activated? ? role.deactivate : role.activate
    flash[role.save ? :notice : :error] = "Role : '#{params[:name]}' has been #{role.aasm_state}."
    redirect_to roles_path
  end

  private

  def role_params
    params.require(:role).permit(:name, permission_attributes: [permissions: INTERFACES])
  end

end
