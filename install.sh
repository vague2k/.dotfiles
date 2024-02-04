#!/bin/sh

# Detect the operating system
os=$(uname -s)

# Run script based on the operating system
case "$os" in
    Linux*)
        echo "Running the Linux script..."
        sleep 1
        sh ./linux_install.sh
        ;;
    Darwin*)
        echo "Running the macOS script..."
        sleep 1
        sh ./macos_install.sh
        ;;
    #CYGWIN*|MINGW32*|MSYS*|MINGW*)
    #    sleep 1
    #    echo "Running the Windows script..."
    #    sh ./windows_script.sh
    #    ;;
    *)
        echo "Unsupported operating system: $os"
        ;;
esac

