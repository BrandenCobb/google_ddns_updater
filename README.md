# Google Domain DNS auto-updater

#### Set up a Dynamic DNS synthetic record:
  1. Sign in to Google Domains.
  2. Select the name of your domain.
  3. Open the hamburger menu (Top Left).
  4. Click **DNS**.
  5. Scroll down to *Synthetic Records*.
  6. Select **Dynamic DNS** from the list of synthetic record types.
  7. Enter the name of the resource you plan to have assigned a Dynamic IP, either a subdomain or @ for your default domain (“root domain” or “naked domain”).
  8. If you selected sub-domain, enter the name of the subdomain.
  9. Click **Add**.
  10. The Dynamic DNS record is created in your list of synthetic records. Click the **expand triangle** next to the record to view its values.
  11. Click **View Credentials** to view the user name and password created for this record.
  12. Note the username and password created for the synthetic record. You'll need these to configure your gateway or client software to contact the Google name servers.
  You can edit or delete the record with the **Edit** and **Delete** buttons next to the record.

#### Download and run script:
```
curl https://github.com/BrandenCobb/google_ddns_updater/blob/main/ddns_update.sh
vi ddns_update.sh ## Modify username, password, and hostname
chmod +x ddns_update.sh
./ddns_update.sh
```
#### Download and add 5 minute cronjob:
```
curl https://github.com/BrandenCobb/google_ddns_updater/blob/main/ddns_update.sh
vi ddns_update.sh ## Modify username, password, and hostname
chmod +x ddns_update.sh
sudo mv ddns_update.sh /usr/local/bin/
sudo echo "*/5 * * * * root /usr/local/bin/ddns_update.sh" >> /etc/crontab
```

Never manually update your dns record again!
