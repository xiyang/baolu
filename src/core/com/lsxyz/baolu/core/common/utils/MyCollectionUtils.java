package com.lsxyz.baolu.core.common.utils;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.beanutils.BeanMap;
import org.apache.commons.beanutils.BeanPredicate;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.ComparatorUtils;
import org.apache.commons.collections.Predicate;
import org.apache.commons.collections.PredicateUtils;
import org.apache.commons.collections.comparators.NullComparator;
import org.apache.commons.collections.comparators.ReverseComparator;
import org.apache.commons.collections.functors.EqualPredicate;
import org.apache.commons.collections.iterators.ReverseListIterator;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/**
 * <pre>
 * Provides utility methods and decorators for {@link Collection} instances. 
 * This class inherits all properties of CollectionUtils{@link CollectionUtils} and adds some convient methods 
 * &lt;b&gt;Fix for https://issues.apache.org/jira/browse/BEANUTILS-352&lt;/b&gt;
 * 
 * Please refer Testcase for further usage {@link CollectionsUtilExtTestCase}
 * @author Ganesh Gowtham
 * 
 */
@SuppressWarnings("unchecked")
public class MyCollectionUtils extends CollectionUtils {
	/** logger */
	private static Log log = LogFactory.getLog(MyCollectionUtils.class);

	/**
	 * Returns the Equal Predicate based on beanPropertyName and value
	 * 
	 * @param beanPropertyName
	 *            ( Property of ValueObject which not null (or) empty)
	 * @param value
	 * @return
	 */
	private static BeanPredicate getEqualPredicate(String beanPropertyName,
			Object value) {
		assertNotNull("BeanPropertyName cannot not be null", beanPropertyName);
		EqualPredicate nameEqlPredicate = new EqualPredicate(value);
		BeanPredicate beanPredicate = new BeanPredicate(beanPropertyName,
				nameEqlPredicate);
		return beanPredicate;
	}

	/**
	 * Converts the valueObject to Map whose key is propertyName and value as
	 * corresponding value for PropertyName
	 * 
	 * @param beanObject
	 * @return
	 */
	public static Map<String, Object> beanToMap(Object beanObject) {
		return new BeanMap(beanObject);
	}

	/**
	 * Converts the List of Maps based on beanPropertyName <br>
	 * For example if passed List of User's and intials as beanPropertyName it
	 * returns the map whose key is intial and corresponding value is
	 * ValueObject <br>
	 * <code>listToMap(collection,"intials");</code>
	 * 
	 * @param <T>
	 * @param collection
	 *            - Collection of ValueObject
	 * @param beanPropertyName
	 *            - property of valueObject
	 * @return
	 * @throws ImproperUsageException
	 */
	public static <T> Map<String, T> listToMap(Collection<T> inputCollection,
			String beanPropertyName) {
		assertNotNull("Collection cannot be null ", inputCollection);
		Map<String, T> map = new HashMap<String, T>(inputCollection.size());
		for (T t : inputCollection) {
			try {
				map.put(BeanUtils.getSimpleProperty(t, beanPropertyName), t);
			} catch (Exception e) {
				log.error("Exception in CollectionsUtilExt.listToMap", e);
			}
		}
		return map;
	}

	/**
	 * Returns the ValueObject whose beanPropertyName is least <br>
	 * For Ex : <code>min(list,"salary")</code> ==> Returns the valueObject
	 * whose salary is least <br>
	 * If more than one valueObject having least salary then <code>min()</code>
	 * will return first matching valueObject from colelction passed @
	 * 
	 * @param <T>
	 * @param collection
	 *            - List of ValueObjects
	 * @param beanPropertyName
	 * @param nullsAreHigh
	 *            a <code>true</code> value indicates that <code>null</code>
	 *            should be compared as higher than a non-<code>null</code>
	 *            object. A <code>false</code> value indicates that
	 *            <code>null</code> should be compared as lower than a non-
	 *            <code>null</code> object.
	 * @return
	 */
	public static <T> T min(Collection<T> inputCollection,
			String beanPropertyName, boolean nullsAreHigh) {
		assertNotNull("Collection cannot be null ", inputCollection);
		Comparator<T> nullComparator = new NullComparator(nullsAreHigh);
		Comparator<T> beanComparator = new BeanComparator(beanPropertyName,
				nullComparator);
		T selectedObject = Collections.min(inputCollection, beanComparator);
		return selectedObject;
	}

	/**
	 * Returns the ValueObject whose beanPropertyName is greatest For Ex :
	 * max(list,"salary") ==> Returns the valueObject whose salary is greater
	 * 
	 * @param <T>
	 * @param collection
	 * @param beanPropertyName
	 * @param nullsAreHigh
	 *            a <code>true</code> value indicates that <code>null</code>
	 *            should be compared as higher than a non-<code>null</code>
	 *            object. A <code>false</code> value indicates that
	 *            <code>null</code> should be compared as lower than a non-
	 *            <code>null</code> object.
	 * @return
	 */
	public static <T> T max(Collection<T> inputCollection,
			String beanPropertyName, boolean nullsAreHigh) {
		assertNotNull("Collection cannot be null ", inputCollection);
		Comparator<T> nullComparator = new NullComparator(nullsAreHigh);
		Comparator<T> beanComparator = new BeanComparator(beanPropertyName,
				nullComparator);
		T selectedObject = Collections.max(inputCollection, beanComparator);
		return selectedObject;
	}

	/**
	 * Sorts the List of ValueObjects based on beanPropertyName array
	 * 
	 * @param <T>
	 * @param list
	 * @param beanPropertyName
	 * @param nullsAreHigh
	 *            a <code>true</code> value indicates that <code>null</code>
	 *            should be compared as higher than a non-<code>null</code>
	 *            object. A <code>false</code> value indicates that
	 *            <code>null</code> should be compared as lower than a non-
	 *            <code>null</code> object.
	 * @param isAscending
	 *            - sorts in Ascending if true , else desending
	 */
	public static <T> void sortCollection(List<T> list, boolean isAscending,
			String... beanPropertyName) {
		assertNotNull("Collection cannot be null ", list);
		/*
		 * NullComparator should be passed as isAscending ,Since null values
		 * needs to handled in dif way
		 */
		Comparator<T> nullComparator = new NullComparator(isAscending);
		Collection<Comparator<T>> beanComparatorCollection = new ArrayList<Comparator<T>>(beanPropertyName.length);
		for (int i = 0; i < beanPropertyName.length; i++) {
			beanComparatorCollection.add(new BeanComparator(beanPropertyName[i], nullComparator));
		}
		
		Comparator<T> finalComparator = ComparatorUtils.chainedComparator(beanComparatorCollection);
		if (!isAscending) {
			finalComparator = new ReverseComparator(finalComparator);
		}
		Collections.sort(list, finalComparator);
	}
	
	/**
	 * Returns the Value Object from List based on beanPropertyName and
	 * beanPropertyValue For Example
	 * selectObjectFromCollection(list,"firstName","yahoo") ==> Returns Value
	 * Object whose firstname is Yahoo If more than one valueObject exist for
	 * given criteria , it picks first matching one
	 * 
	 * @param <T>
	 * @param list
	 * @param beanPropertyName
	 * @param beanPropertyValue
	 * @return
	 */
	public static <T> T selectFilteredObject(Collection<T> inputCollection,
			String beanPropertyName, Object beanPropertyValue) {
		assertNotNull("Collection cannot be null ", inputCollection);
		BeanPredicate beanPredicate = null;
		if (beanPropertyValue != null) {
			beanPredicate = getEqualPredicate(beanPropertyName,
					beanPropertyValue);
		} else {
			beanPredicate = new BeanPredicate(beanPropertyName, PredicateUtils
					.nullPredicate());
		}
		T selectedObject = (T) find(inputCollection, beanPredicate);
		return selectedObject;
	}

	/**
	 * Returns the list of valueObjects whose valueObjects property having value
	 * value Example if beanPropertyName is "intials" and value is "GAGO" it
	 * returns the list of ValueObjects whose intials are "GAGO"
	 * 
	 * @param <T>
	 * @param list
	 * @param beanPropertyName
	 *            - Property Name of Value Object
	 * @param beanPropertyValue
	 *            - Value corresponding to beanPropertyName
	 * @return
	 */
	public static <T> Collection<T> selectFilteredCollection(
			Collection<T> inputCollection, String beanPropertyName,
			Object beanPropertyValue) {
		assertNotNull("Collection cannot be null ", inputCollection);
		BeanPredicate beanPredicate = getEqualPredicate(beanPropertyName,
				beanPropertyValue);
		Collection<T> selectedList = select(inputCollection, beanPredicate);
		return selectedList;
	}

	/**
	 * Convient method which takes custom Predicate
	 * 
	 * @param <T>
	 * @param list
	 * @param customPredicate
	 * @return
	 */
	public static <T> Collection<T> selectFilteredCollection(
			Collection<T> inputCollection, Predicate customPredicate) {
		assertNotNull("Collection cannot be null ", inputCollection);
		Collection<T> selectedList = select(inputCollection, customPredicate);
		return selectedList;
	}

	/**
	 * Select's from the collection whose beanPropertyName and beanPropertyValue
	 * For Ex we can select User whose firstname = 'smith' anf lastname='john'
	 * we pass firstname and lastname in beanPropertyName[] we pass smith and
	 * john in beanPropertyNamevalue[]
	 * 
	 * @param <T>
	 * @param list
	 * @param beanPropertyName
	 *            - String array of bean properties names
	 * @param beanPropertyValue
	 *            - Object array of values corresponding to bean properties in
	 *            beanPropertyName
	 * @return
	 */
	public static <T> Collection<T> selectFilteredCollection(
			Collection<T> inputCollection, String[] beanPropertyName,
			Object[] beanPropertyValue) {
		assertNotNull("Collection cannot be null ", inputCollection);
		Collection<T> selectedList = inputCollection;
		if (!ArrayUtils.isEmpty(beanPropertyName)
				&& !ArrayUtils.isEmpty(beanPropertyValue)) {
			assertEquals(
					"Length of beanPropertyName and beanPropertyValue are mismatching ",
					beanPropertyName.length, beanPropertyValue.length);
			Predicate[] predicateArray = new Predicate[beanPropertyName.length];
			for (int i = 0; i < beanPropertyName.length; i++) {
				if (beanPropertyValue[i] != null) {
					predicateArray[i] = getEqualPredicate(beanPropertyName[i],
							beanPropertyValue[i]);
				} else {
					predicateArray[i] = new BeanPredicate(beanPropertyName[i],
							PredicateUtils.nullPredicate());
				}
			}
			selectedList = select(inputCollection, PredicateUtils
					.allPredicate(predicateArray));
		}
		return selectedList;
	}

	/**
	 * Returns the list of valueObjects whose valueObjects property having value
	 * value Example if beanPropertyName is "intials" and value is "GAGO" it
	 * returns the list of ValueObjects whose intials are <b>NOT</b> "GAGO"
	 * 
	 * @param <T>
	 * @param list
	 * @param beanPropertyName
	 *            - Property Name of Value Object
	 * @param beanPropertyValue
	 *            - Value of
	 * @return
	 */
	public static <T> Collection<T> selectRejectedCollection(
			Collection<T> inputCollection, String beanPropertyName,
			Object beanPropertyValue) {
		assertNotNull("Collection cannot be null ", inputCollection);
		BeanPredicate beanPredicate = getEqualPredicate(beanPropertyName,
				beanPropertyValue);
		Collection<T> selectedList = selectRejected(inputCollection,
				beanPredicate);
		return selectedList;
	}

	/**
	 * Modifies ValueObject in Collection
	 * 
	 * @param <T>
	 * @param list
	 *            List of ValueObjects
	 * @param beanPropertyName
	 *            PropertyName of ValueObject
	 * @param originalValue
	 *            Original Value
	 * @param valueToBeChanged
	 * @throws ImproperUsageException
	 * @return
	 */
	public static <T> Collection<T> modifyObjectsFromCollection(
			Collection<T> inputCollection, String beanPropertyName,
			Object originalValue, Object valueToBeChanged) {
		assertNotNull("Collection cannot be null ", inputCollection);
		BeanPredicate beanPredicate = getEqualPredicate(beanPropertyName,
				originalValue);
		Collection<T> selectedList = select(inputCollection, beanPredicate);
		try {
			for (T t : selectedList) {
				BeanUtils.setProperty(t, beanPropertyName, valueToBeChanged);
			}
		} catch (Exception e) {
			log.error("Exception in CollectionsUtilExt.modifyCollection ", e);
		}
		return selectedList;
	}

	/**
	 * Counts the number of elements in the input collection that match the
	 * beanPropertyName with value specified in beanPropertyValue.
	 * <p>
	 * A <code>null</code> collection or predicate matches no elements.
	 * 
	 * @param inputCollection
	 *            the collection to get the input from, may be null
	 * @param beanPropertyName
	 *            - String array of bean properties names
	 * @param beanPropertyValue
	 *            - Object array of values corresponding to bean properties in
	 *            beanPropertyName
	 * @return the number of matches for the predicate in the collection
	 */
	public static int countMatches(Collection inputCollection,
			String[] beanPropertyName, String[] beanPropertyValue) {
		int matches = 0;
		if (!ArrayUtils.isEmpty(beanPropertyName)
				&& !ArrayUtils.isEmpty(beanPropertyValue)) {
			assertEquals(
					"Length of beanPropertyName and beanPropertyValue are mismatching ",
					beanPropertyName.length, beanPropertyValue.length);
			Predicate[] predicateArray = new Predicate[beanPropertyName.length];
			for (int i = 0; i < beanPropertyName.length; i++) {
				if (beanPropertyValue[i] != null) {
					predicateArray[i] = getEqualPredicate(beanPropertyName[i],
							beanPropertyValue[i]);
				} else {
					predicateArray[i] = new BeanPredicate(beanPropertyName[i],
							PredicateUtils.nullPredicate());
				}
			}
			matches = countMatches(inputCollection, PredicateUtils
					.allPredicate(predicateArray));
		}
		return matches;
	}

	/**
	 * Debug the collection and appends output to Log with debug level
	 * 
	 * @param <T>
	 * @param inputCollection
	 */
	<T> void debugCollection(Collection<T> inputCollection) {
		if (CollectionUtils.isNotEmpty(inputCollection)) {
			for (T t : inputCollection) {
				log.debug("[ " + ToStringBuilder.reflectionToString(t) + " ]");
			}
		}
	}

	/**
	 * Returns the reverse iterator based on {@link List} passed Order of
	 * elements in orginal collections wont get changed after the calling of
	 * reverseIterator(...)
	 * 
	 * @param <T>
	 * @param inputCollection
	 * @return
	 */
	<T> Iterator<T> reverseIterator(List<T> inputCollection) {
		assertNotNull("Input List should not be null ", inputCollection);
		ReverseListIterator reverseListIterator = new ReverseListIterator(
				inputCollection);
		return reverseListIterator;
	}
}
