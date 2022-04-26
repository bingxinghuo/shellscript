for entry in $(ls *.jp2 -v); do
  filename="${entry##*/}"
  real_file=${filename%.jp2}

  echo "Original: "$real_file".jp2"
  echo "Converted: "$real_file".tif"

kdu_expand -i $real_file".jp2" -o $real_file"_small.tif" -reduce 6