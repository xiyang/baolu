package com.lsxyz.baolu.core.exception;

/**
 * ObjectNotFoundException exception
 *
 * @author  Rui Zhou, Copyright &#169; 2008 foundersoftware. All Rights Reserved.
 * @version 1.00, 2009-02-10 14:00
 */
public class ObjectNotFoundException extends DAOException {
	private static final long serialVersionUID = -2497331288743160972L;

	/**
	 * Create a new ObjectNotFoundException with the specified message.
	 * @param msg the detail message
	 */
	public ObjectNotFoundException(String msg) {
		super(msg);
	}

	/**
	 * Create a new ObjectNotFoundException with the specified message
	 * and root cause.
	 * @param msg the detail message
	 * @param ex the root cause
	 */
	public ObjectNotFoundException(String msg, Throwable ex) {
		super(msg, ex);
	}
}
