#This is my Token
TARGET_TOKEN='*****'
STICKER_PACKAGE_ID=446
STICKER_ID=1988
MESSAGE="$1"

curl -X POST -H "Authorization: Bearer ${TARGET_TOKEN}" -F "message=${MESSAGE}" -F "stickerPackageId=${STICKER_PACKAGE_ID}" -F "stickerId=${STICKER_ID}"  https://notify-api.line.me/api/notify