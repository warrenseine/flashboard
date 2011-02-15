Orbit Appliance Demo
====================

Orbit is a tool to create rich, live and interactive multi-user applications across web and mobile platforms.

We provide a demo of Orbit inside a virtual machine. This is the easiest way we found to show you a working demo of Orbit that'll work whatever your environment is. Please contact us if you want to try Orbit.

Requirements
------------

* [Orbit appliance](http://aerys.in/contact)
* [VirtualBox](http://www.virtualbox.org/)
* [Flash Builder](http://www.adobe.com/products/flashbuilder/) -- Recommended to run the client application.

Getting stated
--------------

* Start VirtualBox
* Add a machine and select `Orbit.vbox`
* Open VM settings
* Navigate to *Network* / *Adapter 1* / *Advanced* / *Port Forwarding*
* Create a new rule `flashboard' to redirect host port 4248 to VM port 4248
* Start the VM
* Open a terminal
* Go into the demo project (`$ cd Demo/flashboard`)
* Compile it (`$ waf configure build install --prefix=/var/orbit`)
* Enable the application (`$ cd /var/orbit/apps/ && ln -s available enabled`)
* Run it (`$ orbit -d /var/orbit start`)
* Open Flash Builder
* Create a new Flex project called `flashboard`
* Select the folder `flashboard/client` (clone it if needed)
* Press Next twice
* Click *Browse* next to *Main applicaiton file* and select `Flashboard.mxml`
* Run the Flex application
* Draw!

Troubleshooting
---------------
Make sure you have correctly set up port forwarding and that the server says `Flashboard server started on 0.0.0.0:4248`.
