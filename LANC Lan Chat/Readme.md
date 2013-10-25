LANC 2
======

Making a LANCX Server
------
Run the LANCChannelMaker and follow the instructions.
Copy the LANCX folder to the desired (server) path.
If the LANCX folder is going to be put onto a UNC path, do not type in the path of the server.

LANCX Folders
-------------

    If the LANCX server is in a non-UNC location, for example dropbox, type Load to quickly load the location data.
    If the LANCX server is in a UNC location, run pushload.

Breakdown of the LANCX Folder;

    admin.txt             | This file contains the admin password.
	avsrvr.dat            | This file contains the master list of defined channels.
	LANCX.txt             | Maintains keep-alive.
	orom-a                | To-Admin Messages.
	orom-c                | Chat Channel Logs
	orom-m                | Channel MOTD
	orom-aL               | Discarded To-Admin Messages
	orom-L                | Discarded Chat Channel Logs
	BAN_      .usr        | Banned Username.
	REG_      .usr        | A Registered User's Key File.
	                      | If the second line = 1, the user has moderator permissions.
	KCK_      .tmp        | An If-Exist Kick & Delete File.
    PM_       .log        | Private Messages.
	
Encrypting Chats
------

Make an orom-x#.txt file, # for channel number.
Store the password inside.