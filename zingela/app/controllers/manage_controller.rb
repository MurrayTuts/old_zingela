class ManageController < ApplicationController
  before_action :allow_admin, only: [:companies,:edit_company,:delete_company]
  def companies
    @companies = Company.all
  end
  def users
    @users = User.where(:company_id=>current_company.id)
  end
  def edit_company
    @company = Company.find(params[:id])
  end
  def delete_company
    Company.delete(params[:id])
    redirect_to root_path
  end
private
  def allow_admin
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
