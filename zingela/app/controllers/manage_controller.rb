class ManageController < ApplicationController
  before_action :allow_admin, only: [:companies]
  def companies
    @companies = Company.all
  end
  def users
    @users = User.where(:company_id=>current_company.id)
  end
  private
  def allow_admin
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
