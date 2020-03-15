class TweetsController < ApplicationController
    def index
        @tweets=Tweet.all.order(updated_at: "DESC").page(params[:page]).per(5)
    end

    def new
        unless user_signed_in?
            redirect_to action: :index
        end
    end

    def create
        
        Tweet.create(
            image:params[:image],
            text:params[:text],
            user_id:current_user.id
            

        )
        

        
    end

end
