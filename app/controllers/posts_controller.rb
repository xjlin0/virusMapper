class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = params[:tag_id].nil? ? Post.all : Post.tagged_with(ActsAsTaggableOn::Tag.find(params[:tag_id]))
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def create
    @post = Post.new(post_params)
    hash_tags = @post.content.scan(/\B#\w*[a-zA-Z]+\w*/)  #http://erictarn.com/post/1060722347
    @post.save_cached_tag_list
    @post.tag_list.add(hash_tags)

    if @post.save
      flash.notice = "Your tweet is successfully created"
    else
      flash.alert =  "You've got some errors in your post, say, too long?" # <%= debug(params) if Rails.env.development? %>
    end
    redirect_to request.env['HTTP_REFERER']
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update #
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote    # UPDATE /posts/:id/vote.json
    p 'PostsController  line 64'
    p params
    #return nil unless params[:voter_hash] && params[:voter_hash] == Digest::SHA1.hexdigest(current_user.id.to_s) #defense against unauthorized voting
    vote_count = 0
    p "PostsController  line 67"
    @post = Post.find(params[:id])
    if params[:vote] == 'Up'
      @post.upvote_by(current_user)
      vote_count = @post.get_likes.size
    elsif params[:vote] == 'Down'
      @post.downvote_by(current_user)
      vote_count = @post.get_dislikes.size
    end
    p "PostsController  line 77"
    p vote_count
    respond_to { |format| format.json { render json: vote_count } }

#check if voter_hash equals current_user.id hash


# upvote_by ..... => Add upvote by current_user
# get_dislikes.size => Count all downvotes
# get_likes.size => Count all upvotes


    # @results = term.nil? ? [] : User.search(name: term) #+ Post.search(content: term)
    # respond_to { |format| format.json { render json: @results } }
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id, :tag_list, :tag_id, :voter_hash, :vote)
    end
end
