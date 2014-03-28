/*
   Copyright (c) 2008. Adobe Systems Incorporated.
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

     * Redistributions of source code must retain the above copyright notice,
       this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution.
     * Neither the name of Adobe Systems Incorporated nor the names of its
       contributors may be used to endorse or promote products derived from this
       software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
*/
package org.flexunit.listeners
{
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IRunListener;
	import org.flexunit.runner.notification.ITemporalRunListener;

	[Deprecated(replacement="TestRunnerBase can be used directly now.", since="4.1")]
	public class UIListener implements ITemporalRunListener
	{
		private var uiListener : ITemporalRunListener;
		
		public function UIListener( uiListener : ITemporalRunListener )
		{
			super();
			this.uiListener = uiListener;
		}
		
		public function testRunStarted( description:IDescription ):void {
			this.uiListener.testRunStarted( description );
		}
		
		public function testRunFinished( result:Result ):void {
			this.uiListener.testRunFinished( result );
		}
		
		public function testStarted( description:IDescription ):void {
			this.uiListener.testStarted(description );
		}
	
		public function testFinished( description:IDescription ):void {
			this.uiListener.testFinished( description );
		}
	
		public function testFailure( failure:Failure ):void {
			this.uiListener.testFailure( failure );
		}
	
		public function testAssumptionFailure( failure:Failure ):void {
			this.uiListener.testAssumptionFailure( failure );
		}
	
		public function testIgnored( description:IDescription ):void {
			this.uiListener.testIgnored( description );
		}
		
		public function testTimed( description:IDescription, runTime:Number ):void {
			this.uiListener.testTimed( description, runTime );
		}
	}
}