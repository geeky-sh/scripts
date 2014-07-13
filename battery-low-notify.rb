require 'washbullet'
client = Washbullet::Client.new('v1fjkeba2rEECQIXT571Wi5QRKlAYIYNreujydPjC7FPo')

iden = 'ujydPjC7FPodjzWIEVDzOK'

status = `cat /sys/class/power_supply/BAT0/capacity`.strip.to_i
if status < 5
	client.push_note(iden, "Arch Battery Status < 5%. The system will now be suspended. Please Plug the charger soon")
	`sudo pm-suspend`
elsif status < 15
	client.push_note(iden, "Arch Battery Status", "Battery Low: #{status}%. Please connect the charger")
end
