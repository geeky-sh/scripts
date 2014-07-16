require 'washbullet'
client = Washbullet::Client.new('v1fjkeba2rEECQIXT571Wi5QRKlAYIYNreujydPjC7FPo')

iden = 'ujydPjC7FPodjzWIEVDzOK'

percent = `cat /sys/class/power_supply/BAT0/capacity`.strip.to_i
status = `cat /sys/class/power_supply/BAT0/status`.strip

if percent < 5 && status == 'Discharging'
	client.push_note(iden, "Arch Battery Status < 5%.", " The system will now be suspended. Please Plug the charger soon")
	`sudo pm-suspend`
elsif percent < 15 && status == 'Discharging'
	client.push_note(iden, "Arch Battery Status", "Battery Low: #{percent}%. Please connect the charger")
end
