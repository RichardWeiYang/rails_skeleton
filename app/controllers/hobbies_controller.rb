class HobbiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @hobbies = Hobby.all
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = Hobby.new(hobby_params)

    if @hobby.save
      redirect_to hobbies_path
    else
      render :new
    end
  end

  def edit
    @hobby = Hobby.find(params[:id])
  end

  def update
    @hobby = Hobby.find(params[:id])
    if @hobby.update(hobby_params)
      redirect_to hobbies_path
    else
      render :edit
    end
  end

  def destroy
    @hobby = Hobby.find(params[:id])

    @hobby.destroy

    redirect_to hobbies_path
  end

  private

  def hobby_params
    params.require(:hobby).permit(:title, :image, :popular_time)
  end

end
