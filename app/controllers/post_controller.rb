class PostController < ApplicationController
  # before_action :authenticate_user! # 모든 action하기 전에 먼저 실행
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :authenticate_user!, only: [:index, :new]

  def index
    @post = Post.all.reverse
  end

  def new #new action은 할일이 없음 그냥 화면(view)만 필요함
  # 로그인 여부 확인하기
  end

  def create
    uploader = ImageUploader.new # imageuploader를 uploader에 저장
    uploader.store!(params[:image]) # 들어온 file(image)을 저장

    @post = Post.new # model은 대문자로 시작
    
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.user_id = current_user.id #user_id 꼭 해야함
    @post.image = uploader.url
    # 데이터베이스를 삭제하지 않고 colum을 추가하는 방법
    # rails g migration add_변수명_to_적용시킬 데이터모델 변수명:자료형
    @post.thumb = uploader.thumb.url
    @post.middle = uploader.middle.url
    
    @post.save
    redirect_to "/post/index"
  end

  def update
    @post = Post.find(params[:id])
    
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    
    @post.save
    redirect_to "/post/show/#{params[:id]}"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id = @post.user_id
      @post.destroy
      redirect_to "/post/index"
    else
      # redirect_to "/home/index"
      redirect_to "/post/index"
    end
    
  end

  def show
    @post = Post.find(params[:id])
    # Post.find_by_title # 제목으로 검색이 가능
  end
  
  def search
    # Post.where(:title => "밖에 비온다") # 정확하게 같은 문자열만 보여줌
    # Post.where("title LIKE ?", "%밖에 비온다%") # 문자열 앞뒤가 달라도 보여줌(%가 앞뒤로 있기 때문)
    if params[:cate] == "1"
      @post = Post.where("title LIKE ?", "%#{params[:q]}%") # Post 안에 있는 colum 중 하나를 적고 q의 값을 원한다
    elsif params[:cate] == "2"
      @post = Post.where("content LIKE ?", "%#{params[:q]}%")
    elsif params[:cate] == "3"
      @post = Post.where("title  LIKE ? OR content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    elsif params[:cate] == "4"
      # @post = User.where("username LIKE ?", "%#{params[:q]}%") # 유저만 가져오기 때문에 오류가 뜬다
      @post = User.where("username LIKE ?", "%#{params[:q]}%").take.posts # take로 하나의 유저만 뽑고 그 유저는 포스트를 많이 가지고 있기 때문에 posts를 사용
    end
    
  end
  
end
