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
package org.flexunit.runner.manipulation
{
	/**
	 * An actionscript only cursor class which allows simple iteration through
	 * objects in a collection
	 */
	public interface ISimpleCursor
	{
	    /**
	     *  If the cursor is located after the last item in the view, 
	     *  this property is <code>true</code> .
	     *  If the ICollectionView is empty (length == 0),
	     *  this property is <code>true</code>.
	     */
	    function get afterLast():Boolean;
	
	    //----------------------------------
	    //  beforeFirst
	    //----------------------------------
	
	    /**
	     *  If the cursor is located before the first item in the view,
	     *  this property is <code>true</code>.
	     *  If the ICollectionView is empty (length == 0),
	     *  this property is <code>true</code>.
	     */
	    function get beforeFirst():Boolean;
	
	    //----------------------------------
	    //  current
	    //----------------------------------	    
	    /**
	     *  Provides access the object at the location
	     *  in the source collection referenced by this cursor.
	     *  If the cursor is beyond the ends of the collection
	     *  (<code>beforeFirst</code>, <code>afterLast</code>)
	     *  this will return <code>null</code>.
	     *
	     *  @see #moveNext()
	     *  @see #movePrevious()
	     *  @see #seek()
	     *  @see #beforeFirst
	     *  @see #afterLast
	     */
	    function get current():Object;
	
	    /**
	     *  Moves the cursor to the next item within the collection.
	     *  On success the <code>current</code> property is updated
	     *  to reference the object at this new location.
	     *  Returns <code>true</code> if the resulting <code>current</code> 
	     *  property is valid, or <code>false</code> if not 
	     *  (the property value is <code>afterLast</code>).
	     *
	     *  <p>If the data is not local and an asynchronous operation must be performed,
	     *  an ItemPendingError is thrown.
	     *  See the ItemPendingError documentation and  the collections
	     *  documentation for more information on using the ItemPendingError.</p>
	     *
	     *  @return <code>true</code> if still in the list,
	     *  <code>false</code> if the <code>current</code> value initially was
	     *  or now is <code>afterLast</code>.
	     *
	     *  @see #current
	     *  @see #movePrevious()
	     *
	     *  @example
	     *  <pre>
	     *  var myArrayCollection:ICollectionView = new ArrayCollection([ "Bobby", "Mark", "Trevor", "Jacey", "Tyler" ]);
	     *  var cursor:IViewCursor = myArrayCollection.createCursor();
	     *  while (!cursor.afterLast)
	     *  {
	     *      trace(cursor.current);
	     *      cursor.moveNext();
	     *  }
	     *  </pre>
	     */
	    function moveNext():Boolean;
	
	    /**
	     *  Moves the cursor to the previous item within the collection.
	     *  On success the <code>current</code> property is updated
	     *  to reference the object at this new location.
	     *  Returns <code>true</code> if the resulting <code>current</code> 
	     *  property is valid, or <code>false</code> if not 
	     *  (the property value is <code>beforeFirst</code>).
	     *
	     *  <p>If the data is not local and an asynchronous operation must be performed,
	     *  an ItemPendingError is thrown.
	     *  See the ItemPendingError documentation and the collections
	     *  documentation for more information on using the ItemPendingError.</p>
	     *
	     *  @return <code>true</code> if still in the list,
	     *  <code>false</code> if the <code>current</code> value initially was or
	     *  now is <code>beforeFirst</code>.
	     *
	     *  For example:
	     *  <pre>
	     *  var myArrayCollection:ICollectionView = new ArrayCollection([ "Bobby", "Mark", "Trevor", "Jacey", "Tyler" ]);
	     *  var cursor:IViewCursor = myArrayCollection.createCursor();
	     *  cursor.seek(CursorBookmark.last);
	     *  while (!cursor.beforeFirst)
	     *  {
	     *      trace(current);
	     *      cursor.movePrevious();
	     *  }
	     *  </pre>
	     *
	     *  @see #current
	     *  @see #moveNext()
	     *  @see mx.collections.errors.ItemPendingError
	     */
	    function movePrevious():Boolean;
	}
}