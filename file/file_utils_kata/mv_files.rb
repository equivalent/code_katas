require 'fileutils'

# inside desired directory
Dir.glob('./**/*.mp4').each do |video|
  FileUtils.mv(video, './videos')
end
