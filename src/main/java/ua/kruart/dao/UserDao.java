package ua.kruart.dao;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.kruart.model.User;

import java.util.List;

@Repository
@Transactional
public class UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    public User getById(int id){
        return sessionFactory.getCurrentSession().get(User.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<User> searchUsers(String name){
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        criteria = criteria.add(Restrictions.ilike("name", "%"+name+"%"));
        return criteria.list();
    }

    @SuppressWarnings("unchecked")
    public List<User> getAllUsers(int pageNumber){
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        criteria = criteria.setFirstResult(10 * (pageNumber - 1));
        criteria = criteria.setMaxResults(10);
        return criteria.list();
    }

    public int save(User user){return (Integer) sessionFactory.getCurrentSession().save(user);}

    public void update(User user) {sessionFactory.getCurrentSession().merge(user);}

    public void delete(int id){
        User user = getById(id);
        sessionFactory.getCurrentSession().delete(user);
    }

    @SuppressWarnings("unchecked")
    public List<User> getAllOfUsers(){
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        return criteria.list();
    }
}
