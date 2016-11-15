DX Base demo Templates set
===

This is the templates set used for the sample demo site [Digitall](https://github.com/Jahia/digitall) 

Required module dependencies
---

* bootstrap3-components
* bootstrap3-core
* default
* dx-base-demo-core
* font-awesome
* calendar
* event
* facets
* grid
* jquery
* location
* news
* person
* press
* rating
* search
* topstories

How to compile
---
Use maven to compile the module

    mvn clean install

How to install on DX 
---
Ensure that all the dependencies are installed and started.
Copy the build jar (dx-base-demo-templates-X.X.X[-SNAPSHOT].jar) from the target folder to DX (digital-factory-data/modules) or use the module manager from DX Administration to upload it.
