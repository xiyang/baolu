package com.lsxyz.baolu.core.exception;


/**
 * The class <code>BaseException</code> and its subclasses are a form of 
 * <code>Exception</code> that indicates conditions that a reasonable 
 * application might want to catch.
 *
 * @author  Rui Zhou, Copyright &#169; 2008 foundersoftware. All Rights Reserved.
 * @version 1.00, 2009-02-10 13:16
 */
public class BaseException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	//exception message
	protected String message;
	
	//exception cause
	protected Throwable cause;

	//exception cause information
	protected String causeMessage;	
	
    /**
     * Constructs a new exception with <code>null</code> as its detail message.
     */
	public BaseException() {
		super();
	}
	
    /**
     * Constructs a new exception with the specified detail message.
     * 
     * @param   message   the detail message. The detail message is saved for 
     *          later retrieval by the {@link #getMessage()} method.
     */
    public BaseException(String message) {
    	super(message);
    	this.message = message;
    }
    
    /**
     * Constructs a new exception with the specified cause.
     * 
     * @param  cause the cause (which is saved for later retrieval by the
     *         {@link #getCause()} method).  (A <tt>null</tt> value is
     *         permitted, and indicates that the cause is nonexistent or
     *         unknown.)
     */
    public BaseException(Throwable cause) {
        super(cause);
        if (cause != null) {
        	this.causeMessage = cause.toString();
        }
    }
    
    /**
     * Constructs a new exception with the specified detail message and
     * cause.  
     * 
     * @param  message the detail message (which is saved for later retrieval
     *         by the {@link #getMessage()} method).
     * @param  cause the cause (which is saved for later retrieval by the
     *         {@link #getCause()} method).  (A <tt>null</tt> value is
     *         permitted, and indicates that the cause is nonexistent or
     *         unknown.)
     */
    public BaseException(String message, Throwable cause) {
        super(message, cause);
        this.message = message;
        this.cause = cause;
        if (cause != null) {
        	this.causeMessage = cause.toString();
        }
    }
	
	public Throwable getCause() {
		return cause;
	}
	
	public String getMessage() {
		return message;
	}

	public String getCauseMessage() {
		return causeMessage;
	}

}
