Install Prerequisites
---------------------

    Before using FlexUnit tutorials you must install the following software and set the
    corresponding environment variables using absolute file paths.  Relative file paths
    will result in build errors.
    
	==================================================================================
    SOFTWARE                                    ENVIRONMENT VARIABLE (absolute paths)
    ==================================================================================
    
    Java SDK 1.6 or greater (*1)                JAVA_HOME
        (for Java 1.7 see note at (*2))
        
    Ant 1.7.1 or greater (*1)                   ANT_HOME
        (for Java 1.7 see note at (*2))
    
    Apache Flex (*3)                            FLEX_HOME 
    
    ==================================================================================
	
	*1) The bin directories for ANT_HOME and JAVA_HOME should be added to your PATH.
        
        On Windows, set PATH to
            
            PATH=%PATH%;%ANT_HOME%\bin;%JAVA_HOME%\bin
            
        On the Mac (bash), set PATH to
            
            export PATH="$PATH:$ANT_HOME/bin:$JAVA_HOME/bin"
            
         On Linux make sure you path include ANT_HOME and JAVA_HOME.

    *2)  If you are using Java SDK 1.7 or greater on a Mac you must use Ant 1.8 or 
         greater. If you use Java 1.7 with Ant 1.7, ant reports the java version as 1.6 
         so the JVM args for the data model (-d32/-d64) will not be set correctly and
         you will get compile errors.
        
    *3) FLEX_HOME should be set to a valid Apache Flex installation.
	
	
Software Dependencies
--------------------- 

    When you have all the prerequisites in place and the environment variables set, 
    (see Install Prerequisites above), use

        ant -f downloads.xml
		
	in each tutorial project. 