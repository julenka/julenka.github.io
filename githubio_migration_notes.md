# My notes
The generated/compiled html pages are now at https://github.com/julenka/julenka.github.io
The content for my html is still at git@github.com:julenka/jsnet.git.
I will use Jekyll to compile html from jsnet folder into julenka.github.io.


# David's notes
My website is hosted by GitHub Pages.
My domain used to be configured with Bluehost (see below for Google Domains info).

Go to Bluehost’s Domain Manager and click on Manage DNS Records to make changes for a domain (AKA Zone Editor). 
This was needed to set up the domain to point to GitHub’s page initially.
I had to create two A records to point my apex domain to GitHub’s IP addresses.
I think the A records should use “@“ as the host.
You might also want to add a CNAME pointing “www" to davidklionsky.com
It’s OK to terminate my Bluehost hosting but still manage my domains with them.

My domains are now managed by domains.google.com.
Setup for pointing to GitHub pages is the same as above.
Create two A records pointing “@“ to the IP addresses from GitHub's instructions.
Optionally create a CNAME pointing “www” to davidklionsky.com
At some point I had to update the IP addresses in Google's A record to take advantage of GitHub’s https support. 