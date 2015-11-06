class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]
  before_filter :deny_to_visitors

  # GET /welcomes
  # GET /welcomes.json
  def index
  end


private

def deny_to_visitors
  redirect_to new_user_session_path unless user_signed_in? or admin_signed_in? or company_signed_in?
end
end
