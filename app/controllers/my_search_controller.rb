# frozen_string_literal: true

class MySearchController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_access

  def index
    @searches = policy_scope(MySearch).paginate(page: params[:page], per_page: 10)
  end

  def destroy_all
    @searches.delete_all

    redirect_to my_search_path
  end

  private

  def authorize_access
    redirect_to root_path if current_user.admin?
  end
end
