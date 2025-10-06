#!/bin/bash
# Convert all OGG files in the current folder to CAF, overwrite existing, delete original OGG
for f in *.ogg
do
  [ -f "$f" ] || continue  # skip if no files
  base="${f%.ogg}"
  outfile="$base.caf"
  
  echo "Converting: $f → $outfile"
  ffmpeg -y -i "$f" -c:a adpcm_ima_qt "$outfile"

  if [ $? -eq 0 ]; then
    rm "$f"  # delete original OGG
    echo "✅ Converted and removed: $f"
  else
    echo "❌ Conversion failed for: $f"
  fi
done
echo "✨ All CAF conversions done!"
read -n 1 -s -r -p "Press any key to close..."
