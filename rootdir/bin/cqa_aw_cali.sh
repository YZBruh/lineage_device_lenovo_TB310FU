#! /vendor/bin/sh
#!/bin/bash

function start_cali
{
    echo "start_cali start"
	rm -rf "/data/vendor/vcodec/cqa_awcali.ret"
	sleep 1
    RET=$(aw_cali start_cali)
	sleep 1
	echo $RET > "/data/vendor/vcodec/cqa_awcali.ret"
	echo "---" >> "/data/vendor/vcodec/cqa_awcali.ret"
	RETRDC1=$(cat /sys/bus/i2c/drivers/aw883xx_smartpa/6-0034/dsp_re)
	echo $RETRDC1 >> "/data/vendor/vcodec/cqa_awcali.ret"
	echo "---" >> "/data/vendor/vcodec/cqa_awcali.ret"
	RETRDC2=$(cat /sys/bus/i2c/drivers/aw883xx_smartpa/6-0035/dsp_re)
	echo $RETRDC2 >> "/data/vendor/vcodec/cqa_awcali.ret"
    echo "start_cali end"
	chmod 777 "/data/vendor/vcodec/cqa_awcali.ret"
}

function stop_cali
{
    echo "stop_cali start"
	rm -rf "/data/vendor/vcodec/cqa_awcali.ret"
	echo "stop_cali end"
}

command=$1
case $command in
        (start_cali)
        start_cali
        ;;
        (stop_cali)
        stop_cali
        ;;
        (*)
        echo "error args"
esac
