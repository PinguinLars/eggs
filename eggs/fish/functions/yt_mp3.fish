function yt_mp3 -a url name
    yt-dlp $url -o ir.webm && ffmpeg -i ir.webm $name.mp3 && rm ir.webm
end
