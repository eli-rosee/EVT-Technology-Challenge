sudo service nginx start
sudo service nginx stop // graceful shutdown
sudo service nginx reload // reloads config without dropping connections
sudo service nginx restart

sudo service nginx status

sudo nginx -t && sudo service nginx reload

curl http://localhost