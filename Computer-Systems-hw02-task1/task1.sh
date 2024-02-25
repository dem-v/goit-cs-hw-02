array=("https://google.com" "https://facebook.com" "https://twitter.com")

for item in "${array[@]}"; do
    res=$(curl -o /dev/null -s -w "%{http_code}\\n" "$item")
    if [ $res -eq 200 ]
    then
    echo "$res $item UP" >> website_status.log
    elif [ $res -lt 400 ]
    then
    echo "$res $item UNKWN" >> website_status.log
    else
    echo "$res $item DOWN" >> website_status.log
    fi
done

echo "Resutls saved to website_status.log"