package com.lsxyz.baolu.core.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import java.io.Serializable;
import java.sql.Connection;
import java.util.Collection;
import java.util.List;


/**
 * Interface <code>IBaseDAO</code> is the root of the DAO hierarchy.
 * 
 * @author  Rui Zhou, Copyright &#169; 2008 foundersoftware. All Rights Reserved.
 * @version 1.00, 2008-12-19 13:55
 */
public interface IBaseDAO<T> {
	 /**
     * Generic method used to get all objects of a particular type. This
     * is the same as lookup up all rows in a table.
     * @return List of populated objects
     */
	List<T> getObjects();
	
	/**
     * Generic method to get an object based on identifier. 
     * An ObjectRetrievalFailureException Runtime Exception is thrown if 
     * nothing is found.
     * @param id The identifier (primary key) of the class
     * @return A populated object
     * @see org.springframework.orm.ObjectRetrievalFailureException
     */
	T getObject(Serializable id);
	
	
	/**
	 * Generic method to insert an object
	 * @param obj The object to insert
	 * @return The new object's id
	 */
	Serializable createObject(T obj);
	
	/**
     * Generic method to update an object
     * @param obj The object to update
     */
	void updateObject(T obj);
	
	/**
     * Generic method to saveorupdate an object
     * @param obj The object to update
     */
	void saveObject(T obj);
	
	void merge(T entity);
	
	/**
     * Generic method to delete an object based on id
     * @param obj The object to delete
     */
	void deleteObject(T obj);
	

	/**
	 * Delete object by id;
	 * @param id
	 */
	void deleteObject(Serializable id);
	
	
	/**
     * Generic method to delete objects
     * @param objs The objects to delete
     */
	void deleteObjects(Collection<T> objs);
	
	/**
	 * Generic method to query objects acorrding to hql clause
	 * @param hql The hql clause
	 * @return List of queried objects
	 */
	List find(String hql);
	
	/**
	 * Generic method to query objects acorrding to hql clause and a parameter
	 * @param hql The hql clause
	 * @param para The parameter for the hql clause
	 * @return List of queried objects
	 */
	List find(String hql, Object para);
	
	/**
	 * Generic method to query objects acorrding to hql clause and parameters
	 * @param hql The hql clause
	 * @param paras	The parameters for the hql clause 
	 * @return List of queried objects
	 */
	List find(String hql, Object[] paras);
		
	/**
	 * Generic method to query objects acorrding to hql clause and parameters
	 * @param hql The hql clause
	 * @param paraNames The parameter names for the hql clause
	 * @param paraValues The parameter values for the hql clause
	 * @return List of queried objects
	 */
	List find(String hql, String[] paraNames, Object[] paraValues);
	
	/**
	 * Generic method to query objects acorrding to hql clause and a parameter
	 * @param hql The hql clause
	 * @param paraName The parameter name for the hql clause
	 * @param paraValue The parameter value for the hql clause
	 * @return List of queried objects
	 */
	List<T> find(String hql, String paraName, Object paraValue);
	
	/**
	 * Query the Object list by the Property
	 * @param propertyName
	 * @param value
	 * @return List of queried objects
	 */
	List<T> findByProperty(String propertyName, Object value);
	
	/**
	 * Query the unique Object by the Property 
	 * @param propertyName
	 * @param value
	 * @return A populated object
	 */
	T findUniqueByProperty(String propertyName, Object value);
	
	Object findUnique(String hql, Object... values);
	
	/**
	 * Create the Query object by the query function and params list
	 * continue, can do more executing
	 * @param queryString
	 * @param values
	 * @return Query
	 */
	Query createQuery(String queryString, Object... values);
	
	/**
	 * Get current session
	 * @return session
	 */
	Session getCurrentSession();
	
	/**
	 * Gets current connection
	 * @return connection
	 */
	Connection getConnection();
	
	T load(Serializable id);
	
}
