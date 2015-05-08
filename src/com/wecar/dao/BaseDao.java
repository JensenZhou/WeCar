package com.wecar.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wecar.model.BaseObject;

@Repository
public class BaseDao<T> {
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	protected List<T> getOjects(Class<T> classz) {
		Session session = sessionFactory.getCurrentSession();
		List<T> list = session.createCriteria(classz).list();
		return list;
	}
	
	protected Integer insertObject(T obj) {
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(obj);
	}
	
	@SuppressWarnings("unchecked")
	protected T getObjectById(Class<T> classz, Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (T)session.byId(classz).load(id);
	}
	
	@SuppressWarnings("unchecked")
	protected T getObjectByParam(Class<T> classz, Map<String, Object> params) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(classz);
		if (params != null) {
			Set<String> keys = params.keySet();
			for (String key : keys) {
				criteria.add(Restrictions.eq(key, params.get(key)));
			}
		}
		List<T> list = (List<T>)criteria.list();
		if (list != null && list.size() >0) {
			return list.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	protected List<T> getAllObjects(Class<T> classz) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(classz);
		return (List<T>)criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	protected List<T> getObjectsByParam(Class<T> classz, Map<String, Object> params) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(classz);
		if (params != null) {
			Set<String> keys = params.keySet();
			for (String key : keys) {
				criteria.add(Restrictions.eq(key, params.get(key)));
			}
		}
		return (List<T>)criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	protected List<T> getObjectsByParam(Class<T> classz, Map<String, String> aliasParams, Map<String, Object> params) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(classz);
		if (aliasParams != null) {
			Set<String> aliasKeys = aliasParams.keySet();
			for (String key : aliasKeys) {
				criteria.createAlias(key, aliasParams.get(key));
			}
		}
		if (params != null) {
			Set<String> keys = params.keySet();
			for (String key : keys) {
				criteria.add(Restrictions.eq(key, params.get(key)));
			}
		}
		return (List<T>)criteria.list();
	}
	
	protected void remove(T obj) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(obj);
	}
	
	protected void delete(BaseObject obj) {
		obj.setDeleted(true);
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
	}
	
	protected void batchDelete(List<? extends BaseObject> objs) {
		Session session = sessionFactory.getCurrentSession();
		for(BaseObject obj : objs) {
			obj.setDeleted(true);
			session.update(obj);
		}
	}
	
	protected void batchUpdate(List<? extends BaseObject> objs) {
		for(BaseObject obj : objs) {
			Session session = sessionFactory.getCurrentSession();
			session.update(obj);
		}
	}
	
	protected void update(T obj) {
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
	}
}
