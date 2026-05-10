#!/usr/bin/env bash

# ==========================================
# SMART FILE ORGANIZER
# ==========================================

# ---------- COLORS ----------

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

# ---------- COUNTERS ----------

moved_files=0
skipped_files=0

# ---------- HEADER ----------

clear

echo -e "${CYAN}"
echo "=========================================="
echo "         SMART FILE ORGANIZER"
echo "=========================================="
echo -e "${RESET}"

# ---------- FOLDERS ----------

folders=(
    "images"
    "videos"
    "documents"
    "archives"
    "audio"
    "scripts"
    "web"
    "programs"
    "fonts"
    "ebooks"
    "others"
)

# ---------- CREATE FOLDERS ----------

echo -e "${BLUE}[+] Checking folders...${RESET}"

for folder in "${folders[@]}"
do

    if [[ ! -d "$folder" ]]
    then

        mkdir -p "$folder"

        echo -e "${GREEN}[CREATED]${RESET} $folder"

    else

        echo -e "${YELLOW}[EXISTS]${RESET} $folder"

    fi

done

echo

# ---------- ORGANIZE FILES ----------

echo -e "${BLUE}[+] Organizing files...${RESET}"

for file in *
do

    # Skip directories
    [[ -d "$file" ]] && continue

    # Skip hidden files
    [[ "$file" == .* ]] && continue

    # Skip this script itself
    [[ "$file" == "$(basename "$0")" ]] && continue

    if [[ -f "$file" ]]
    then

        case "${file,,}" in

            # ---------- IMAGES ----------

            *.jpg|*.jpeg|*.png|*.gif|*.webp|*.svg|*.bmp|*.ico)

                mv -n "$file" images/

                echo -e "${GREEN}[IMAGE]${RESET} $file -> images/"

                ((moved_files++))
                ;;

            # ---------- VIDEOS ----------

            *.mp4|*.mkv|*.avi|*.mov|*.webm|*.flv)

                mv -n "$file" videos/

                echo -e "${GREEN}[VIDEO]${RESET} $file -> videos/"

                ((moved_files++))
                ;;

            # ---------- DOCUMENTS ----------

            *.pdf|*.txt|*.doc|*.docx|*.ppt|*.pptx|*.xls|*.xlsx)

                mv -n "$file" documents/

                echo -e "${GREEN}[DOC]${RESET} $file -> documents/"

                ((moved_files++))
                ;;

            # ---------- ARCHIVES ----------

            *.zip|*.tar|*.gz|*.rar|*.7z)

                mv -n "$file" archives/

                echo -e "${GREEN}[ARCHIVE]${RESET} $file -> archives/"

                ((moved_files++))
                ;;

            # ---------- AUDIO ----------

            *.mp3|*.wav|*.ogg|*.flac)

                mv -n "$file" audio/

                echo -e "${GREEN}[AUDIO]${RESET} $file -> audio/"

                ((moved_files++))
                ;;

            # ---------- SCRIPTS ----------

            *.sh|*.py|*.js|*.php|*.rb)

                mv -n "$file" scripts/

                echo -e "${GREEN}[SCRIPT]${RESET} $file -> scripts/"

                ((moved_files++))
                ;;

            # ---------- WEB FILES ----------

            *.html|*.css|*.scss|*.json)

                mv -n "$file" web/

                echo -e "${GREEN}[WEB]${RESET} $file -> web/"

                ((moved_files++))
                ;;

            # ---------- PROGRAMS ----------

            *.deb|*.AppImage|*.rpm)

                mv -n "$file" programs/

                echo -e "${GREEN}[PROGRAM]${RESET} $file -> programs/"

                ((moved_files++))
                ;;

            # ---------- FONTS ----------

            *.ttf|*.otf)

                mv -n "$file" fonts/

                echo -e "${GREEN}[FONT]${RESET} $file -> fonts/"

                ((moved_files++))
                ;;

            # ---------- EBOOKS ----------

            *.epub|*.mobi)

                mv -n "$file" ebooks/

                echo -e "${GREEN}[EBOOK]${RESET} $file -> ebooks/"

                ((moved_files++))
                ;;

            # ---------- OTHERS ----------

            *)

                mv -n "$file" others/

                echo -e "${YELLOW}[OTHER]${RESET} $file -> others/"

                ((skipped_files++))
                ;;

        esac

    fi

done

echo
echo -e "${CYAN}==========================================${RESET}"

echo -e "${GREEN}[DONE]${RESET} Files moved : $moved_files"

echo -e "${YELLOW}[OTHER FILES]${RESET} $skipped_files"

echo -e "${CYAN}==========================================${RESET}"
