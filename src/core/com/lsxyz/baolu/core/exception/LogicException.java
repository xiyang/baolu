package com.lsxyz.baolu.core.exception;

/**
 * logic exception
 *
 * @author  Rui Zhou, Copyright &#169; 2008 foundersoftware. All Rights Reserved.
 * @version 1.00, 2009-02-10 13:40
 */
public class LogicException extends BaseException {
	
	private static final long serialVersionUID = -1297698896148666069L;

    /**
     * Constructs a new exception with <code>null</code> as its detail message.
     */
	public LogicException() {
		super();
	}
	
    /**
     * Constructs a new exception with the specified detail message.
     * 
     * @param   message   the detail message.
     */
	public LogicException(String message) {
		super(message);
	}
	
    /**
     * Constructs a new exception with the specified cause.
     * 
     * @param  cause the cause. 
     */
	public LogicException(Throwable cause) {
		super(cause);
	}
	
    /**
     * Constructs a new exception with the specified detail message and
     * cause.  
     * 
     * @param  message the detail message .
     * @param  cause the cause.
     */
	public LogicException(String message, Throwable cause) {
		super(message, cause);
	}

}
