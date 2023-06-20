package tw.gym.service.activity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.activity.ActivityDao;
import tw.gym.model.activity.ActivityBean;

@Service
@Transactional
public class ActivityService {

	@Autowired
    private ActivityDao aDao;

    public ActivityBean insert(ActivityBean aBean) {
        return aDao.insert(aBean);
    }

    public ActivityBean update(ActivityBean aBean) {
        return aDao.update(aBean);
    }

    public ActivityBean selectById(int activityId) {
        return aDao.selectById(activityId);
    }

    public List<ActivityBean> selectAll() {
        return aDao.selectAll();
    }

    public boolean delete(int activityId) {
        return aDao.delete(activityId);
    }
}