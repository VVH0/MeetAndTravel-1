class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tip, only: [:show, :edit, :update, :destroy]


  def new
    @tip = Tip.new
  end

  def show
  end

  def index
    @tips = Tip.where(creator_id: current_user)
  end

  def create
    @tip = Tip.new(tip_params)
    if params[:tip][:pictures] != nil
      @tip.pictures.attach(params[:tip][:pictures])
    end
    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @tip.destroy
    redirect_to tips_path
  end

  def update
    if current_user.id == @tip.creator_id
      @tip.update(tip_params)
      redirect_to tip_path(@tip.id)
    else
      flash[:notice] = "Tu ne peux pas éditer ce bon plan"
      redirect_to root_path
    end
  end

  def recent
   @tip = Tip.recent
   render action: :index
  end

  def oldest
   @tip = Tip.oldest
   render action: :index
  end

  private

  def tip_params
    params.require(:tip).permit(:category_ids, :street, :city, :country, :id, :title, :description, :pictures, :site,:name,category_ids:[]).merge(creator_id: current_user.id)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

end
