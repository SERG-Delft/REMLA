# expects site.surfdrive_id to be defined (the hash in the path)
#
# it is then possible to use
#   {% surfdrive /path/to/file.ext %}
# to generate valid surfdrive links

class SurfdriveTag < Liquid::Tag
  def initialize(tag_name, path, tokens)
    super

	# a surfdrive link for /folder/some sub/file.txt looks like:
	# https://surfdrive.surf.nl/<...>/download?path=%2Ffolder%2Fsome%20sub&files=file.txt

	# replace url chars
	path.strip! # trim whitespace from start and end
	path = path.gsub("/", "%2F").gsub(" ", "%20").gsub("+", "%2B").gsub("&", "%26")

	# construct partial information
    parts = path.split("%2F") # /
    file = parts.pop
    folder = parts.join("%2F") # /

    # request surfdrive id, fail if non-existing
    surfdrive_id = Jekyll.configuration({})['surfdrive_id']

    if not surfdrive_id then
    	raise "site.surfdrive_id is required in _config.yml, but seems to be undefined or empty"
    end
    surfdrive_id.strip!
    
    # put together results
    @url = "https://surfdrive.surf.nl/files/index.php/s/" + surfdrive_id + "/download?path=" + folder + "&files=" + file
  end

  def render(context)
    @url
  end
end

Liquid::Template.register_tag('surfdrive', SurfdriveTag)

