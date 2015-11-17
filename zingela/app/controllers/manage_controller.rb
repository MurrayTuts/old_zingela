class ManageController < ApplicationController
  before_action :allow_admin, only: [:companies,:edit_company,:delete_company,:update_company,:users]
  def users
    @users = User.all
  end
  def edit_user
    @user = User.find(params[:id])
  end
  def delete_user
    User.delete(params[:id])
    redirect_to manage_users_path
  end
  def update_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/edit/user/#{@user.id}", notice: 'User was successfully updated.'
    else
      render :edit_user
    end
  end

  def companies
    @companies = Company.all
  end
  def edit_company
    @company = Company.find(params[:id])
  end
  def delete_company
    Company.delete(params[:id])
    redirect_to manage_companies_path
  end
  def update_company
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to "/edit/company/#{@company.id}", notice: 'Company was successfully updated.'
    else
      render :edit_company
    end
  end
  private
    def allow_admin
      redirect_to new_admin_session_path unless admin_signed_in?
    end
    def allow_company
      redirect_to new_company_session_path unless company_signed_in?
    end
    def company_params
        params.require(:company).permit(:company_name, :email, :password, :password_confirmation)
    end
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
