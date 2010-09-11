require 'sinatra'

class Lookup < Sinatra::Base
  get '/' do
    cmdline= <<CMDEND
tell first document of application "Delicious Library 2"
    look up "#{params[:barcode]}"
end tell
CMDEND
    puts cmdline
    #TODO - pipe this through osascript rather than save it to a file
    open("script.txt", "w") { |io| io.write(cmdline) }
    system "osascript script.txt"
    params[:barcode]
  end
end

