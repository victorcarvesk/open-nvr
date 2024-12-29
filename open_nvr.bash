#!/usr/bin/env bash

source ./credentials.bash

VIDEO_DIR="./recorder"
REMOTE_DIR="~/Desktop"

LOG_FILE="./log/logfile.log"

camera_stream=rtsp://$IPCAM_USER:$IPCAM_PASS@$IPCAM_ADDR:554/stream1
video_duration=10

check_network() {
    ping -c 1 ${SERVER_ADDR} &> /dev/null
    return $?
}

record_video() {
    timestamp=$(date "+%Y-%m-%d-%H-%M-%S")
    video_file="${VIDEO_DIR}/${timestamp}.mp4"
    
    ffmpeg -t $video_duration -rtsp_transport udp -i $camera_stream $video_file

    if [[ -f "$video_file" ]]; then
        echo "$(date "+%Y-%m-%d %H:%M:%S") - Arquivo salvo como $video_file" >> "$LOG_FILE"
        return 0
    else
        echo "$(date "+%Y-%m-%d %H:%M:%S") - Arquivo NÃO salvo." >> "$LOG_FILE"
        return 1
    fi
}

send_video() {
    video_file="$1"
    check_network
    if [[ $? -eq 0 ]]; then
        echo "$(date "+%Y-%m-%d %H:%M:%S") - Rede disponível, enviando para o servidor..." >> "$LOG_FILE"
        
        scp "$video_file" "${SERVER_USER}@${SERVER_ADDR}:${REMOTE_DIR}/" >> "$LOG_FILE"
        if [[ $? -eq 0 ]]; then
            echo "$(date "+%Y-%m-%d %H:%M:%S") - Envio bem-sucedido: $video_file" >> "$LOG_FILE"
            rm -rf $video_file
        else
            echo "$(date "+%Y-%m-%d %H:%M:%S") - Erro no envio do vídeo: $video_file" >> "$LOG_FILE"
        fi
    else
        echo "$(date "+%Y-%m-%d %H:%M:%S") - Rede não disponível, não enviando o arquivo: $video_file" >> "$LOG_FILE"
    fi
}

run_openvr() {
    while true; do
        record_video
        if [[ $? -eq 0 ]]; then
            send_video "$video_file"
        fi
        sleep 1
    done
}

run_openvr
