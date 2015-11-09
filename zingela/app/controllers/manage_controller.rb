class ManageController < ApplicationController
  before_action :allow_admin, only: [:companies,:edit_company,:delete_company,:update_company]
  before_action :allow_company, only: [:users]
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
end
