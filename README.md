Apache Flex FlexUnit
====================

Apache Flex FlexUnit is a unit testing framework for Apache Flex and ActionScript 3.0 
applications and libraries. It mimics the functionality of JUnit, a Java 
unit testing framework, and comes with a graphical test runner.

Getting the latest sources via git
==================================

You can always checkout the latest source via git using the following
command:

    git clone https://git-wip-us.apache.org/repos/asf/flex-flexunit.git flexunit
    cd flexunit
    git checkout develop

For further information visit http://flex.apache.org/download-source.html

Building Apache Flex FlexUnit
=============================

Apache Flex FlexUnit requires some build tools which must be installed
prior to building FlexUnit and it depends on some external software which
are downloaded as part of the build process.  Some of these have different licenses.
See the Software Dependencies section for more information on the external software
dependencies.
	
Install Prerequisites
---------------------

Before building FlexUnit you must install the following software and set the
corresponding environment variables using absolute file paths.  Relative file paths
will result in build errors.

| SOFTWARE                     | ENVIRONMENT VARIABLE <br> (absolute paths) |
| ---------------------------- | -------------------------------------:|
| Java SDK 1.6 or greater (*1)<br> (for Java 1.7 see note at (*2)) | JAVA_HOME |
| Ant 1.7.1 or greater (*1)<br> (for Java 1.7 see note at (*2))    | ANT_HOME  |
| Apache Flex (*3)                                             | FLEX_HOME |

1. The bin directories for ANT_HOME and JAVA_HOME should be added to your PATH.
    
  On Windows, set PATH to ```PATH=%PATH%;%ANT_HOME%\bin;%JAVA_HOME%\bin```
    
  On the Mac (bash), set PATH to ```export PATH="$PATH:$ANT_HOME/bin:$JAVA_HOME/bin"```
    
  On Linux make sure you path include ```ANT_HOME``` and ```JAVA_HOME```.

2. If you are using Java SDK 1.7 or greater on a Mac you must use Ant 1.8 or 
 greater.
 
  If you use Java 1.7 with Ant 1.7, ant reports the java version as 1.6 
  so the JVM args for the data model (-d32/-d64) will not be set correctly and
  you will get compile errors.
 
  Also if you use Java SDK 1.7 you may encounter SSL errors when downloading
  3rd party files as part of the build process to fix this issue
 
  On Windows, create an environment variable called ```ANT_OPTS``` with the value

      -Djsse.enableSNIExtension=false
    
  On the Mac (bash):
 
      export ANT_OPTS="-Djsse.enableSNIExtension=false"

3. ```FLEX_HOME``` should be set to a valid Apache Flex installation.
	

Software Dependencies
---------------------

Apache Flex FlexUnit uses third-party code that will be downloaded as part of the Apache
Flex FlexUnit build.  

When you have all the prerequisites in place and the environment variables set, 
(see Install Prerequisites above), use

    cd <flexunit.dir>
    ant thirdparty-downloads
		
The Apache Version 2.0 license is in the LICENSE file.

The following dependencies have licenses which are, or are compatible with, the Apache 
Version 2.0 license.  You will not be prompted to acknowledge the download.  

### jars
 - ant -  http://search.maven.org/remotecontent?filepath=org/apache/ant/ant/1.7.1/ant-1.7.1.jar (Apache 2.0 License)
 - ant-contrib - http://search.maven.org/remotecontent?filepath=ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3.jar (Apache 2.0 License)
 - ant-launcher -  http://search.maven.org/remotecontent?filepath=org/apache/ant/ant-launcher/1.7.1/ant-launcher-1.7.1.jar (Apache 2.0 License)
 - ant-testutil -  http://search.maven.org/remotecontent?filepath=org/apache/ant/ant-testutil/1.7.1/ant-testutil-1.7.1.jar	(Apache 2.0 License)
 - maven-ant-tasks  - http://search.maven.org/remotecontent?filepath=org/apache/maven/maven-ant-tasks/2.1.3/maven-ant-tasks-2.1.3.jar (Apache 2.0 License)
 - dom4j - http://search.maven.org/remotecontent?filepath=dom4j/dom4j/1.6.1/dom4j-1.6.1.jar (BSD License)
 - jaxen - http://search.maven.org/remotecontent?filepath=jaxen/jaxen/1.1-beta-6/jaxen-1.1-beta-6.jar (BSD License)
	
### swcs
 - coverageagent - https://flexcover.googlecode.com/files/flexcover-0.90.zip (MIT License)
 - fluint - https://github.com/flexunit/flexunit/raw/master/FlexUnit4Test/libs/fluint-1_2.swc (MIT License)
 - mockolate - http://cloud.github.com/downloads/drewbourne/hamcrest-as3/hamcrest-as3-flex-1.1.3.zip (MIT License)	
 - mock-as - https://github.com/flexunit/flexunit/raw/master/FlexUnit4Test/libs/mock-as3.swc (BSD License)	
 - hamcrest - http://cloud.github.com/downloads/drewbourne/hamcrest-as3/mockolate-0.9.5.zip (BSD License)
 - flexunit1lib - https://github.com/flexunit/flexunit/raw/master/FlexUnit4Test/libs/FlexUnit1Lib.swc (BSD License)
	
The following dependencies have licenses which Apache considers to be reciprocal
licenses so you will be prompted to acknowledge the license before the software is
downloaded to your system.

### jars
 - junit - http://search.maven.org/remotecontent?filepath=junit/junit/3.8.1/junit-3.8.1.jar (License - CPL 1.0)
 - saxon9he - http://search.maven.org/remotecontent?filepath=net/sf/saxon/Saxon-HE/9.4/Saxon-HE-9.4.jar (License - MPL 1.1)

Building Apache Flex FlexUnit
-----------------------------

When you have all the prerequisites in place and the environment variables set, 
(see Install Prerequisites above), to build Apache Flex FlexUnit use:

    cd <flexunit.dir>
    ant

To clean the build use:

    ant clean

To package the build use:

    ant package

For information on setting up FlexUnit, creating tests, using FlexUnit with
ant or continuous integration please see the FlexUnit section of the Apache
Flex wiki.

https://cwiki.apache.org/confluence/display/FLEX/FlexUnit
     
Thanks for using Apache Flex FlexUnit. Enjoy!

The Apache Flex Project
<http://flex.apache.org>
