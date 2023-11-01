
# Audio Output Toggle Script for Linux Mint

This repository contains a script to toggle the audio output between two predefined sinks (for example, between HDMI and Headphones) on Linux Mint.

## How the Script Works:

1. The script first identifies the currently active audio output.
2. It then switches the default audio output to the other device.
3. Finally, it moves all currently playing audio streams to the newly set default output.

## Prerequisites:

- **pulseaudio** and its utilities must be installed on your system. This is usually the default on most distributions, including Linux Mint.
- The script uses hardcoded sink names. To determine the sink names for your system, you can use the command:
   ```bash
   pacmd list-sinks | grep 'name:' | cut -d'<' -f2 | cut -d'>' -f1

- Update the script with the correct sink names if they are different from the default ones provided.

## Identifying Audio Sinks:

### Step 1: List All Sinks

To list all available audio sinks, you can use the `pacmd` command, which is a part of the PulseAudio suite. Open a terminal and run:

```
pacmd list-sinks
```

This command will provide detailed information about all the audio sinks (output devices) on your system.

```
index: 1
name: <alsa_output.pci-0000_00_1f.3.analog-stereo>
```

This will give a clear list of all available sink names, which you can then hardcode into the script.

### Step 4: Hardcoding into the Script

Once you've identified the sinks you want to toggle between, replace the hardcoded sink names in the script with the ones you extracted:



### Step 2: Extract Sink Names

From the output of the above command, you will see entries like:

```
headphone_sink="YOUR_HEADPHONE_SINK_NAME_HERE"
hdmi_sink="YOUR_HDMI_SINK_NAME_HERE"
```

Replace `YOUR_HEADPHONE_SINK_NAME_HERE` and `YOUR_HDMI_SINK_NAME_HERE` with the appropriate sink names from your system.

By following these steps, you ensure that the script correctly identifies and toggles between your desired audio outputs.



## Setting Up the System Tray Icon:

- Right-click on the Linux Mint panel.
- Choose "Add applets to the panel."
- Find the "Command Launcher" applet and add it to your panel.
- Right-click the newly added command launcher icon on the panel and choose "Configure."
- Set the command to the path of the audio toggle script, for example: /path/to/toggle_audio.sh.
- For the icon, browse and select your preferred icon. This will be the icon displayed in the system tray.
- Click "Close" to save your changes.
Now, whenever you click on the system tray icon, it will execute the script and toggle your audio output.

## License:
This script is released under the MIT License.





