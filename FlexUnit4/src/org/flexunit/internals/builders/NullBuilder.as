package org.flexunit.internals.builders
{
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>NullBuilder</code> does not build an <code>IRunner</code>.  Instead, it provides a value
	 * of <code>null</code> as the <code>IRunner</code>.  The <code>NullBuilder</code> is typically used
	 * if another builder cannot be used at the present time.
	 * 
	 * The <code>AllDefaultPossibilitiesBuilder</code> uses this builder when other builders cannot be used
	 * under certain conditions (ex: AS only project).
	 * 
	 * @see org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder#fluint1Builder()
	 */
	public class NullBuilder extends RunnerBuilderBase
	{
		/**
		 * Constructor.
		 */
		public function NullBuilder()
		{
			super();
		}
		
	}
}