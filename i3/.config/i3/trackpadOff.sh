# Get the id number of the touchpad.
tp_id=`xinput list | grep -i touchpad | awk '{ print $6 }' | sed 's/id=//'`

# Find out whether the touchpad is enabled or not.
tp_enabled=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`

if [ $tp_enabled = 1 ]
then
   xinput set-prop $tp_id "Device Enabled" 0
else
   exit 1
fi
