require 'nokogiri'
require 'open-uri'
require 'libnotify'

link = 'http://www.flipkart.com/moto-g/p/itmdsmbxcrm9wy8r'

result = nil
Nokogiri::HTML(open(link)).search('#mprod-buy-btn a').each do |l|
	result = l.content
end

Libnotify.show(summary: 'MOTO G!', body: "16 GB model arrived: #{result}", icon_path: '/home/geeky-sh/Downloads/motog/mobile-icon.jpg')

