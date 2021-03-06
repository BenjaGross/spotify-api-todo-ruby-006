require 'json'
require 'open-uri'

class SpotifyChart
BASE_URL = "http://charts.spotify.com/api/tracks/"

  def get_url(preference, region)
    "#{BASE_URL}#{preference}/#{region}/weekly/latest"
  end

  def get_json(url)
    # load json given a url here
    # refer to the references if you have questions about this
 
    JSON.parse(`curl #{url}`) #returns a hash with values

  
  end

  def fetch_track_album_artist(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }

    track = music_hash["tracks"][0]
    # artist_name = music_hash["tracks"][0]["artist_name"]
    # album_name = music_hash["tracks"][0]["album_name"]
     
    "#{track["track_name"]} by #{track["artist_name"]} from the album #{track["album_name"]}"

    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
  end


  def most_streamed(region)
    # call on get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    url = get_url("most_streamed", region)
    hash = get_json(url)
    fetch_track_album_artist(hash)
  end

  def most_shared(region)
    # call on get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    url = get_url("most_shared", region)
    hash = get_json(url)
    fetch_track_album_artist(hash)
  end

end
