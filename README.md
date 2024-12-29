# OpenNVR

OpenNVR is a free and open-source **NVR (Network Video Recorder)** system designed for managing IP cameras used in monitoring environments such as homes and small businesses. It offers continuous recording with **automatic backups** to external servers, ensuring secure and efficient data protection.

## About the Project

OpenNVR aims to **reduce the cost and complexity** of traditional NVR systems. The project provides a simple and secure interface, allowing anyone to set up and operate their NVR system within minutes.

With simplicity at its core, OpenNVR leverages widely available Linux tools, such as Bash and FFMPEG, to deliver a reliable and customizable solution.

## Requirements

To run OpenNVR, you will need:

- **Operating System:** Ubuntu (Server or Desktop)
- **Required Tools:**
  - Bash
  - FFMPEG

## Key Features

- **Automatic Recording:** Continuous recording of video from IP cameras.
- **Automatic Backups:** Uploads recordings to external servers to prevent data loss.
- **Simple Interface:** Quick and easy setup without complications.
- **Lightweight:** Compatible with low-power devices, such as Raspberry Pi.
- **Flexibility:** Customizable to meet specific user needs.

## Benefits

- **Zero Cost:** Free and open-source solution.
- **Easy Setup:** Perfect for users without advanced technical knowledge.
- **Reliability:** Automatic backups ensure data security.
- **Scalability:** Can be adapted to different scenarios and usage scales.

## Setup credentials

To configure the credentials for the application, create a Bash script named `credentials.bash` and set the following environment variables:

```bash
export IPCAM_ADDR=''  # IP address or hostname of the IP camera
export IPCAM_USER=''  # Username for accessing the IP camera
export IPCAM_PASS=''  # Password for accessing the IP camera

export SERVER_ADDR='' # IP address or hostname of the server
export SERVER_USER='' # Username for accessing the server
