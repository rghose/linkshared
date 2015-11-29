class LinksController < ApplicationController
  def index
    @my_user_id = current_user.id
  end

  def save_shared_url
    @status = "fail"
    url_id = params["url_id"]
    e = Ewarel.where(:id => url_id).first
    user_id = User.where(:email => params["friend_email"]).first
    if not user_id.nil? and  e.user_id == current_user.id and e.user_id != user_id.id
      begin
        f = FriendLinks.new
        f.user_id = user_id.id
        f.link_id = url_id
        f.save!
        @status = "success"
      rescue ActiveRecord::RecordNotSaved
        flash[:notice] = 'Unable to create share'
      end
    end

    flash[:notice] = @status
    redirect_to "/"
  end

  def share
    @url = nil
    e = Ewarel.where(:id => params["url_id"]).first
    if e.nil?
    elsif e.user_id == current_user.id # allow user to share only if it is owned by the same user
      @url = e.url
    end
  end

	def public
		user = params[:username]
		u = User.where(:email => user).first
		@links = []
		@username = user
		if not u.nil?
			e = Ewarel.where(:user_id => u.id, is_public: true)
			e.each{ |ee| @links.append(ee.url)}
    end
	end

	def create_ewarel
		@status = "fail"
		if params.include? :url and Ewarel.url_is_valid(params["url"])
			begin
				e = Ewarel.new
				e.url = params["url"]
				e.user_id = current_user.id
				e.save!
			  @status = "success"
			rescue ActiveRecord::RecordNotSaved
				flash[:notice] = 'Unable to create link'
			end
    end

    flash[:notice] = @status
    redirect_to "/"
	end

	def create
		puts 'creating...'
	end
end
