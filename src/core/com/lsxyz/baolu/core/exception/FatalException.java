package com.lsxyz.baolu.core.exception;


public class FatalException extends BaseException {

	private static final long serialVersionUID = -5997621700716504571L;

    /**
     * Constructs a new exception with <code>null</code> as its detail message.
     */
	public FatalException() {
		super();
	}
	
    /**
     * Constructs a new exception with the specified detail message.
     * 
     * @param   message   the detail message.
     */
	public FatalException(String message) {
		super(message);
	}
	
    /**
     * Constructs a new exception with the specified cause.
     * 
     * @param  cause the cause. 
     */
	public FatalException(Throwable cause) {
		super(cause);
	}
	
    /**
     * Constructs a new exception with the specified detail message and
     * cause.  
     * 
     * @param  message the detail message .
     * @param  cause the cause.
     */
	public FatalException(String message, Throwable cause) {
		super(message, cause);
	}


}

