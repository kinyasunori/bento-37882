class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new, :create, :show]

  def index
  end

  

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
