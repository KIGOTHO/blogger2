class TagsController < ApplicationController
    
        include TagsHelper

  def index
        @tags = Tag.all
    end
    
    def show
    @tag = Tag.find(params[:id]) 
   
    end
    
    before_filter :zero_authors_or_authenticated, only: [:destroy]

def zero_authors_or_authenticated
  unless Author.count == 0 || current_user
    redirect_to root_path
    return false
  end
end
    
    def destroy
        @tag = Tag.find(params[:id]).destroy
        flash.notice = "Tag '#{@tag.name}' has been destroyed"
        redirect_to tags_path(@tag)
    end
end
