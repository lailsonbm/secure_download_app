Secure Download Demo App
========================

This is a Rails 2.3.5 demo application that shows how to build a (semi) secure and robust download system. When a file is requested, the app creates a random URL and redirects to it. Some seconds later, this URL is deteled from system, avoiding a replay attack, for example. Currently, it uses a thread to delete the URL, but any queue solution would do it as well.

This setup is also robust because the redirect is managed by the web server (e.g. Apache) insted of blocking the Ruby process until the file is transmitted. This way, the Ruby request lasts only the time required to find the file and create the URL and the download is managed directly by the web sever.

#How to Use
1. Clone the repository.
       git clone git://github.com/lailsonbm/secure_download_app.git

2. Run the database migration (the app uses SQLite3) and start the Rails server.
       rake db:migrate
       script/server
	
3. Access <code>localhost:3000</code> and use the app.