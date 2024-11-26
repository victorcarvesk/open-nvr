#!/usr/bin/env bash

VIDEO_DIR="./recorder"

LOG_FILE="./log/logfile.log"

camera_stream=rtsp://$IPCAM_USERNAME:$IPCAM_PASSWORD@$IPCAM_IP:554/stream1
video_duration=10

check_network() {
    ping -c 1 google.com &> /dev/null
    return $?
}

record_video() {
    timestamp=$(date "+%Y-%m-%d-%H-%M-%S")
    video_file="${VIDEO_DIR}/${timestamp}.mp4"
    
    ffmpeg -t $video_duration -rtsp_transport udp -i $camera_stream $video_file

    if [[ -f "$video_file" ]]; then
        echo "$(date "+%Y-%m-%d %H:%M:%S") - File saved as $video_file" >> "$LOG_FILE"
        return 0
    else
        echo "$(date "+%Y-%m-%d %H:%M:%S") - File not saved." >> "$LOG_FILE"
        return 1
    fi
}

run_openvr() {
    while true; do
        record_video
    done
}

run_openvr
