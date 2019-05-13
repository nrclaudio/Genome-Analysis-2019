for filename in *.tab; do
    head -3044 "$filename" > "output_$filename"
done
