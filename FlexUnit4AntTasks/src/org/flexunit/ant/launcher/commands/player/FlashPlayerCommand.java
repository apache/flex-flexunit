/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
	   if(getSwf() != null)
	   {
		  //setup the command line now
	      getCommandLine().setExecutable(getDefaults().getOpenCommand());
	      getCommandLine().addArguments(getDefaults().getOpenSystemArguments());
	      getCommandLine().addArguments(new String[]{getFileToExecute().getAbsolutePath()});
	      
	      //handle local trust
	      TrustFile trustFile = new TrustFile(getProject(), getDefaults().getFlashPlayerUserTrustDirectory(), getDefaults().getFlashPlayerGlobalTrustDirectory());
	      if (localTrusted)
	      {
	         trustFile.add(getSwf());
	      }
	      else
	      {
	         trustFile.remove(getSwf());
	      }
	   } else if(getUrl() != null) {
	      //handle local trust
	      TrustFile trustFile = new TrustFile(getProject(), getDefaults().getFlashPlayerUserTrustDirectory(), getDefaults().getFlashPlayerGlobalTrustDirectory());
	      if (localTrusted)
	      {
	         trustFile.add(getUrl());
	      }
	      else
	      {
	    	  trustFile.remove(getUrl());
	      }		   
	   }
   }
}
