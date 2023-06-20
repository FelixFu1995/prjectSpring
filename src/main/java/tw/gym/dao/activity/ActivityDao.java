package tw.gym.dao.activity;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.model.activity.ActivityBean;

import java.util.List;

@Repository
@Transactional
public class ActivityDao {

    @Autowired
    private SessionFactory factory;

    public ActivityBean insert(ActivityBean aBean) {
        Session session = factory.getCurrentSession();
        session.save(aBean);
        return aBean;
    }

    public ActivityBean update(ActivityBean aBean) {
        Session session = factory.getCurrentSession();
        session.update(aBean);
        return aBean;
    }

    public ActivityBean selectById(int activityId) {
        Session session = factory.getCurrentSession();
        return session.get(ActivityBean.class, activityId);
    }

    public List<ActivityBean> selectAll() {
        Session session = factory.getCurrentSession();
        return session.createQuery("FROM ActivityBean", ActivityBean.class).list();
    }

    public boolean delete(int activityId) {
        Session session = factory.getCurrentSession();
        ActivityBean aBean = session.get(ActivityBean.class, activityId);
        if (aBean != null) {
            session.delete(aBean);
            return true;
        }
        return false;
    }
}
