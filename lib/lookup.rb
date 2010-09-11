require 'sinatra'

class Lookup < Sinatra::Base
  get '/' do
    cmdline= <<CMDEND
tell first document of application "Delicious Library 2"
    look up "#{params[:barcode]}"
end tell
CMDEND
    puts cmdline
    open("|osascript -", "w") { |io| io.write(cmdline) }
    params[:barcode]
  end
end

