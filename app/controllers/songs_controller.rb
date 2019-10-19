class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end

    def show 
        @song = Song.find(params[:id])
    end

    def edit 
        @song = Song.find(params[:id])
    end

    def new 
        @song = Song.new
    end

    def create 
        @song = Song.new(song_params)
        if @song.valid?
            @song.save 
            
            redirect_to song_path(@song) 
        else
            render "songs/new"
        end
    end

    def update 
     
        @song = Song.find(params[:id])
        @song.update(song_params)
       

        if @song.valid?
           
            redirect_to(@song)
        else
            render "songs/edit"
        end
    end

    def destroy 
        @song = Song.find(params[:id])
        @song.delete
        redirect_to songs_path
    end

    private 
    def song_params 
        params.require(:song).permit(:title,:genre,:artist_name, :release_year, :released)
    end
end
