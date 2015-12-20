class StoriesController < ApplicationController
  before_action :set_story, only: [:edit, :update, :translate, :destroy]

  def index
    if params[:category_id].present?
      @stories = Story.where(category_id: params[:category_id])
    elsif params[:user_id].present?
      @stories = Story.where(user_id: params[:user_id])
    else
      @stories = Story.all
    end
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to root_path}
      else
        format.html { render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to root_path }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def edit
  end

  def destroy
    @story.destroy
    redirect_to :back
  end

  def translate
    if params[:translate_to] == 'original'
      render json: { title: @story.title, content: @story.content }
    else
      response = HTTParty.get(URI.escape("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20151216T114813Z.197ccc999631251d.146ca59b2140c076e5b4032a1558115221a73bbf&text=#{@story.title}&lang=#{params[:translate_to]}"))
      title = JSON.parse(response.body)['text'].join
      response = HTTParty.get(URI.escape("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20151216T114813Z.197ccc999631251d.146ca59b2140c076e5b4032a1558115221a73bbf&text=#{@story.content}&lang=#{params[:translate_to]}"))
      content = JSON.parse(response.body)['text'].join
      render json: { title: title, content: content }
    end
  end

  private

    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :content, :category_id, :rating).merge(user: current_user)
    end

end
