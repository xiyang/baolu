package com.lsxyz.baolu.core.dao.hibernate;

import com.lsxyz.baolu.core.dao.IBaseDAO;
import com.lsxyz.baolu.core.exception.DAOException;
import com.lsxyz.baolu.core.exception.ObjectNotFoundException;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

/**
 * This class implement <code>BaseDAOImpl</code> is the root of the DAO
 * implement hierarchy.
 * 
 * @author Rui Zhou, Copyright &#169; 2008 foundersoftware. All Rights Reserved.
 * @version 1.00, 2008-12-19 14:05
 */
public class BaseDAOHibernate<T> extends HibernateDaoSupport implements 
		IBaseDAO<T> {

	protected static final Logger log = Logger.getLogger(BaseDAOHibernate.class);
	
	protected Class<T> clz;

	/*
	 * Construct method
	 */
	@SuppressWarnings (value={"unchecked"})
	public BaseDAOHibernate() {
		log.debug("start getting class type of template class.");
		clz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass())
				.getActualTypeArguments()[0];
		log.debug("end getting class type of template class:" + clz);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#getObjects()
	 */
	@SuppressWarnings (value={"unchecked"})
	public List<T> getObjects() {
		try {
			return this.getHibernateTemplate().loadAll(clz);
		} catch (DataAccessException e) {
			log.error("Error in getObjects.", e);
			throw new DAOException("Error in getObjects.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#getObject(java.io.Serializable)
	 */
	@SuppressWarnings (value={"unchecked"})
	public T getObject(Serializable id) {
		try {
			T obj = (T) this.getHibernateTemplate().get(clz, id);
			if (obj == null) {
				throw new ObjectNotFoundException("Object for class:"
						+ clz.getSimpleName() + " with id:" + id
						+ " was not found.");
			}
			return obj;
		} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new ObjectNotFoundException("Object with id:" + id
					+ " was not found.", e);
		} catch (DataRetrievalFailureException e) {
			log.error("Error in getObject.", e);
			throw new ObjectNotFoundException("Object with id:" + id
					+ " was not found.", e);
		} catch (DataAccessException e) {
			log.error("Error in getObject.", e);
			throw new DAOException("Error in getObject.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#createObject(java.lang.Object)
	 */
	public Serializable createObject(T obj) {
		try {

			return this.getHibernateTemplate().save(obj);
		} catch (DataAccessException e) {
			log.error("Error in createObject.", e);
			throw new DAOException("Error in createObject.", e);
		}
	}

	
	/* (non-Javadoc)
	 * @see com.founder.cims.common.dao.IBaseDAO#saveObject(java.lang.Object)
	 */
	public void saveObject(T obj) {
		try {
			this.getHibernateTemplate().saveOrUpdate(obj);
		} catch (DataAccessException e) {
			log.error("Error in saveObject.", e);
			throw new DAOException("Error in updateObject.", e);
		}
		
	}

	/* (non-Javadoc)
	 * @see com.founder.cims.core.dao.IBaseDAO#saveObject(java.lang.Object, com.founder.cims.core.audit.AuditUser)
	 */
	
	public void merge(T entity) {
		Assert.notNull(entity);
		getSession().merge(entity);
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#saveObject(java.lang.Object)
	 */
	public void updateObject(T obj) {
		try {
			this.getHibernateTemplate().update(obj);
		} catch (DataAccessException e) {
			log.error("Error in updateObject.", e);
			throw new DAOException("Error in updateObject.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#deleteObject(java.lang.Object)
	 */
	public void deleteObject(T obj) {
		try {
			this.getHibernateTemplate().delete(obj);
		} catch (DataAccessException e) {
			log.error("Error in deleteObject.", e);
			throw new DAOException("Error in deleteObject.", e);
		}
	}

	
	/* (non-Javadoc)
	 * @see com.founder.yacoo.core.dao.IBaseDAO#deleteObject(java.io.Serializable)
	 */
	public void deleteObject(Serializable id) {
		try {
			T obj = (T) this.getHibernateTemplate().get(clz, id);
			if (obj == null) {
				throw new ObjectNotFoundException("Object for class:"
						+ clz.getSimpleName() + " with id:" + id
						+ " was not found.");
			}
			this.getHibernateTemplate().delete(obj);
		} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new ObjectNotFoundException("Object with id:" + id
					+ " was not found.", e);
		} catch (DataRetrievalFailureException e) {
			log.error("Error in getObject.", e);
			throw new ObjectNotFoundException("Object with id:" + id
					+ " was not found.", e);
		} catch (DataAccessException e) {
			log.error("Error in getObject.", e);
			throw new DAOException("Error in getObject.", e);
		} 
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#deleteObjects(java.util.Collection)
	 */
	public void deleteObjects(Collection<T> objs) {
		try {
			this.getHibernateTemplate().deleteAll(objs);
		} catch (DataAccessException e) {
			log.error("Error in deleteObjects.", e);
			throw new DAOException("Error in deleteObjects.", e);
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#find(java.lang.String)
	 */
	@SuppressWarnings (value={"unchecked"})
	public List find(String hql) {
		try {
			return this.getHibernateTemplate().find(hql);
		} catch (DataAccessException e) {
			log.error("Error in find(String).", e);
			throw new DAOException("Error in find.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#find(java.lang.String, java.lang.Object)
	 */
	@SuppressWarnings (value={"unchecked"})
	public List find(String hql, Object para) {
		try {
			return getHibernateTemplate().find(hql, para);
		} catch (DataAccessException e) {
			log.error("Error in find(String, Object).", e);
			throw new DAOException("Error in find.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#find(java.lang.String, java.lang.Object[])
	 */
	@SuppressWarnings (value={"unchecked"})
	public List find(String hql, Object[] paras) {
		try {
			return this.getHibernateTemplate().find(hql, paras);
		} catch (DataAccessException e) {
			log.error("Error in find(String, Object[]).", e);
			throw new DAOException("Error in find.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#find(java.lang.String, java.lang.String[],
	 * java.lang.Object[])
	 */
	@SuppressWarnings (value={"unchecked"})
	public List find(String hql, String[] paraNames, Object[] paraValues) {
		try {
			return this.getHibernateTemplate().findByNamedParam(hql, paraNames,
					paraValues);
		} catch (DataAccessException e) {
			log.error("Error in find(String, String[], Object[]).", e);
			throw new DAOException("Error in find.", e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.founder.dao.IBaseDAO#find(java.lang.String, java.lang.String,
	 * java.lang.Object)
	 */
	@SuppressWarnings (value={"unchecked"})
	public List find(String hql, String paraName, Object paraValue) {
		try {
			return this.getHibernateTemplate().findByNamedParam(hql, paraName,
					paraValue);
		} catch (DataAccessException e) {
			log.error("Error in find(String, String, Object).", e);
			throw new DAOException("Error in find.", e);
		}
	}
	@SuppressWarnings (value={"unchecked"})
	public List find(final String hsql, final int firstRow, final int maxRow) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session s) throws HibernateException,
					SQLException {
				Query query = s.createQuery(hsql);
				query.setFirstResult(firstRow);
				query.setMaxResults(maxRow);
				List list = query.list();
				return list;
			}
		});
	}
	
	
	public Object findUnique(String hql, Object... values) {
		return createQuery(hql, values).setMaxResults(1).uniqueResult();
	}
	
	/* (non-Javadoc)
	 * @see com.founder.cims.common.dao.IBaseDAO#createQuery(java.lang.String, java.lang.Object[])
	 */
	public Query createQuery(String queryString, Object... values) {
		Assert.hasText(queryString);
		Query queryObject = getSession().createQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		return queryObject;
	}

	/* (non-Javadoc)
	 * @see com.founder.cims.common.dao.IBaseDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List<T> findByProperty(String propertyName, Object value) {
		Assert.hasText(propertyName);
		return createCriteria(Restrictions.eq(propertyName, value)).list();
	}
	
	/* (non-Javadoc)
	 * @see com.founder.cims.common.dao.IBaseDAO#findUniqueByProperty(java.lang.String, java.lang.Object)
	 */
	public T findUniqueByProperty(String propertyName, Object value) {
		Assert.hasText(propertyName);
		return (T) createCriteria(Restrictions.eq(propertyName, value)).setMaxResults(1).uniqueResult();
	}
	
	

	/* (non-Javadoc)
	 * @see com.founder.cims.common.dao.IBaseDAO#getCurrentSession()
	 */
	public Session getCurrentSession() {
		return this.getSession();
	}

	/**
	 * Create criteria 
	 */
	private Criteria createCriteria(Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(clz);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}
	
	/* (non-Javadoc)
	 * @see com.founder.cims.common.dao.IBaseDAO#getConnection()
	 */
	public Connection getConnection() {
		return getCurrentSession().connection();
	}
	
	public T load(Serializable id) {
		
		try {
			T obj = (T) this.getHibernateTemplate().load(clz, id);
			if (obj == null) {
				throw new ObjectNotFoundException("Object for class:"
						+ clz.getSimpleName() + " with id:" + id
						+ " was not found.");
			}
			return obj;
		} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new ObjectNotFoundException("Object with id:" + id
					+ " was not found.", e);
		} catch (DataRetrievalFailureException e) {
			log.error("Error in getObject.", e);
			throw new ObjectNotFoundException("Object with id:" + id
					+ " was not found.", e);
		} catch (DataAccessException e) {
			log.error("Error in getObject.", e);
			throw new DAOException("Error in getObject.", e);
		}
	}
}
