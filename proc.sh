#!/bin/bash
URL='https://reserve.gmuc.co.kr/user/camp/campReservation.do?menu=d&menuFlag=C'
PERIOD=100
SLEEP_PERIOD=3600
while((1))
do
	rm input.html
	wget -O input.html "$URL" &> /dev/null
	COUNT=$(./reservation.py)
	NOTIFY_COUNT=0

	if ((COUNT > 0)) 
	then
		MESSAGE="$((COUNT)) 도덕산 캠핑장"
		echo "$MESSAGE"
		./LINE.sh "${MESSAGE}"
		((NOTIFY_COUNT=NOTIFY_COUNT+1))
		if ((NOTIFY_COUNT > 2 ))
		then
			sleep ${SLEEP_PERIOD}
			NOTIFY_COUNT=0
		fi
	fi
sleep ${PERIOD}
done


