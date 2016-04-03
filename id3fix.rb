require 'optparse'
require 'mp3info'

options = {:rename => false, :artist => nil, :title => nil}
filename = ""

parser = OptionParser.new do |opts|
  opts.banner = "Usage: id3fix.rb file [options]"
  opts.on('-r', '--rename', 'Rename the original file with ID3 tag info') do
    options[:rename] = true
  end

  opts.on('-h', '--help', 'Display Help') do
    puts opts
    exit
  end

  opts.on('-a', '--artist artist', 'Change artist') do |a|
    options[:artist] = a
  end

  opts.on('-t', '--title title', 'Change title') do |t|
    options[:title] = t
  end
end

parser.parse!

filepath = ARGV[0] || ""
unless File.exist?(filepath)
  puts "'" + filepath + "'" + " doesn't exist. Please, check the file path."
  puts parser
  exit
end

Mp3Info.open(filepath) do |mp3|
  if options[:title]
    mp3.tag.title = options[:title]
  end

  if options[:artist]
    mp3.tag.artist = options[:artist]
  end

  filename = "#{mp3.tag.artist} - #{mp3.tag.title}"
  puts filename
end


if options[:rename]
  filename.gsub(/[\x00\/\\:\*\?\"<>\|]/, '_')

  num = 2
  oldFilename = filename
  while File.exist?(filename + File.extname(filepath)) 
    filename = oldFilename + " (" + num.to_s + ")"
    num = num + 1
  end
  File.rename(filepath, filename + File.extname(filepath))
end
