<ul>
<li>
<h3>battery-low-notify:</h3>
<div>Use:</div>
<div>I have a archlinux distribution installed where when the battery goes low, I get a small notification on the edge of the screen that the battery is low. Often I don't notice that message when the I am working. Thus when the battery reduces below 5%, and I don't plug the charger, the laptop hiberates. 
I want to get a notification on my mobile whenever the battery percent goes below 5%. Thus, I have written a script, which, when the battery goes low, notifies me on my mobile that the charging is low and I need to plug in the charger immediately. I have also written a case where if I forget to plugin the charger, and if the charging percent goes below 5%, the laptop should go to sleep. 
</div>
Language:
Ruby
Gems Used:
Washbullet (ruby client for push bullet api)
Also I had to add the execution of the script to the crontab as I want the script to poll the battery continously and take action when the charging goes down. 

Here is the crontab line that I had to insert:<br/>
<code>*/5 * * * * /usr/bin/zsh -l -c 'cd ~/ruby_scripts && ruby battery-low-notify.rb'</code>

/usr/bin/zsh -> crontab uses sh by default. I want to use zsh terminal. The -l option is used because I also want that when the zsh loads the configuration file corresponding to it i.e ~/.zshrc file should also run, so that all the environment variables are populated. The first word <code>*/5</code> implies that the script should run every five minutes
</li>
<li>
Flipkart:
<br/>
This script reads the particular page of Flipkart (in this case, the Moto G page), checks if the product is on stock. If yes, it notifies me on the laptop using notify-send. notify-send is the library written in python, that helps in rendering notification messages on the screen.
Language:
Ruby
Gems Used:
Nokogiri (Web/xml parser)
</li>
