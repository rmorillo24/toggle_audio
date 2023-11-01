#!/bin/bash

# Define the function to toggle audio
toggle_audio() {
    # Get the current default sink
    current_sink=$(pacmd info | grep "Default sink name:" | cut -d':' -f2 | xargs)

    # Explicitly specify our sink names
    headphone_sink="alsa_output.pci-0000_00_1f.3.analog-stereo"
    hdmi_sink="alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1"

    # Toggle between the HDMI and Headphones
    if [ "$current_sink" == "$hdmi_sink" ]; then
        new_sink=$headphone_sink
    else
        new_sink=$hdmi_sink
    fi

    pacmd set-default-sink $new_sink

    # Move all current playing streams to the new sink
    for stream in $(pacmd list-sink-inputs | grep 'index:' | cut -d':' -f2 | tr -d ' '); do
        pacmd move-sink-input $stream $new_sink
    done
}

# Specify the icon path (replace with your preferred icon path)
icon_path="/home/rafa/.icons/audio-headphones.png"

toggle_audio