package org.flexunit
{
	import org.flexunit.async.AsyncTestResponder;
	import org.flexunit.events.AsyncResponseEvent;
	import org.flexunit.internals.TextListener;
	import org.fluint.sequence.ISequenceAction;
	import org.fluint.sequence.ISequencePend;
	import org.fluint.sequence.ISequenceStep;
	import org.fluint.sequence.SequenceBindingWaiter;
	import org.fluint.sequence.SequenceCaller;
	import org.fluint.sequence.SequenceDelay;
	import org.fluint.sequence.SequenceEventDispatcher;
	import org.fluint.sequence.SequenceRunner;
	import org.fluint.sequence.SequenceSetter;
	import org.fluint.sequence.SequenceWaiter;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.fluint.uiImpersonation.VisualTestEnvironmentBuilder;
	import org.fluint.uiImpersonation.flex.FlexEnvironmentBuilder;
	import org.fluint.uiImpersonation.flex.FlexMXVisualTestEnvironment;

	/**
	 * These classes should only be included in a Flex project
	 */
	public class IncludeFlexClasses
	{
		private var fxu1:AsyncTestResponder;
		private var fxu4:AsyncResponseEvent;
		
		private var flu1:ISequenceAction;
		private var flu2:ISequencePend;
		private var flu3:ISequenceStep;
		private var flu4:SequenceBindingWaiter;
		private var flu5:SequenceCaller;
		private var flu6:SequenceDelay;
		private var flu7:SequenceEventDispatcher;
		private var flu8:SequenceRunner;
		private var flu9:SequenceSetter;
		private var flu10:SequenceWaiter;
		private var flu11:VisualTestEnvironmentBuilder;
		
		private var flu13:TextListener;
		private var flu14:FlexMXVisualTestEnvironment;
		private var flu15:FlexEnvironmentBuilder;
	}
}