package org.flexunit.ant.launcher.commands.player;

import java.io.File;


/**
 * Abstracts the assembly of a command-line call to the Flash player for all platforms.  
 */
public class FlashPlayerCommand extends DefaultPlayerCommand
{
   public static final String TRUST_FILENAME = "flexUnit.cfg";
   
   private boolean localTrusted;
   
   public FlashPlayerCommand()
   {
      super();
   }

   @Override
   public File getFileToExecute()
   {
      return getSwf();
   }
   
   public void setLocalTrusted(boolean localTrusted)
   {
      this.localTrusted = localTrusted;
   }

   public boolean isLocalTrusted()
   {
      return localTrusted;
   }

   @Override
   public void prepare()
   {
	   //Determine if we have a URL value.
	   //This should be populated by setting the 'swf' property equal to a remote http hosted SWF.
	   if(getUrl() != null && getUrl() != "")
	   {
		  //setup the command line now for remote URL
	      getCommandLine().setExecutable(getDefaults().getOpenCommand());
	      getCommandLine().addArguments(getDefaults().getOpenSystemArguments());
	      getCommandLine().addArguments(new String[]{getUrl()});
	      
	      //There is no need to add to the local trust because we're going to be loading the swf from a remote location.
	      
	   } 
	   //Determine if we have a local SWF to run.
	   //This should be populated by setting the 'swf' property equal to a swf on your local file system. 
	   else if(getSwf() != null) {
		   
		  //setup the command line now with local SWF file location
		  getCommandLine().setExecutable(getDefaults().getOpenCommand());
		  getCommandLine().addArguments(getDefaults().getOpenSystemArguments());
		  getCommandLine().addArguments(new String[]{getFileToExecute().getAbsolutePath()});

		  //handle local trust for locally stored swf file
	      TrustFile trustFile = new TrustFile(getProject(), getDefaults().getFlashPlayerUserTrustDirectory(), getDefaults().getFlashPlayerGlobalTrustDirectory());
	      if (localTrusted)
	      {
	         trustFile.add(getSwf());
	      }
	      else
	      {
	    	  trustFile.remove(getSwf());
	      }		   
	   }
   }
}
