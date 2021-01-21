isUsbKeyboardExist() {
	keyboard=`xinput list | grep "USB Keyboard" | wc -l`
	echo $keyboard
}

forbidOriginKeyboard() {
	id=`xinput list | grep "AT Translated Set 2 keyboard" | awk -F id= '{print $2}' | awk '{print $1}'`
	str="禁用电脑的键盘,id=$id"
	echo $str
	xinput set-prop $id "Device Enabled" 0
}

exist=$(isUsbKeyboardExist)
if [ $exist -eq 0 ]; then
	# 如果不存在外置键盘则不禁用
	echo "外置键盘不存在,不对电脑键盘进行禁用"
else
	echo "存在"
	forbidOriginKeyboard
fi