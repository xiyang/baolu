package com.lsxyz.baolu.core.exception;

/**
 * This exception represents the DAO layer exception.
 *
 * @author  Rui Zhou, Copyright &#169; 2008 foundersoftware. All Rights Reserved.
 * @version 1.00, 2009-02-10 13:56
 */
public class DAOException extends BaseException {
	
	private static final long serialVersionUID = -1297698896148666069L;

    /**
     * Constructs a new exception with <code>null</code> as its detail message.
     */
	public DAOException() {
		super();
	}
	
    /**
     * Constructs a new exception with the specified detail message.
     * 
     * @param   message   the detail message.
     */
	public DAOException(String message) {
		super(message);
	}
	
    /**
     * Constructs a new exception with the specified cause.
     * 
     * @param  cause the cause.
     */
	public DAOException(Throwable cause) {
		super(cause);
	}
	
    /**
     * Constructs a new exception with the specified detail message and
     * cause.  
     * 
     * @param  message the detail message.
     * @param  cause the cause.
     */
	public DAOException(String message, Throwable cause) {
		super(message, cause);
	}
	
}
