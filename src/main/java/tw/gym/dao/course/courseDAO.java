package tw.gym.dao.course;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.model.course.CourseBean;
import tw.gym.model.course.ImageBean;

@Repository
@Transactional
public class courseDAO implements icourseDAO{
	
	@Autowired
	private SessionFactory factory;
	
	//新增課程
	@Override
	public void insertCourse(CourseBean cbean) {
		Session session = factory.openSession();
			session.persist(cbean);
			session.flush();
	}
	//查詢單堂課程
	@Override
	public CourseBean selectCourseById(int courseId) {
		Session session = factory.openSession();
		Query<CourseBean> query = session.createQuery("from CourseBean where courseId = :courseId", CourseBean.class);
		query.setParameter("courseId", courseId);
		CourseBean cbean = query.uniqueResult();
		return cbean;
	}
	//查詢全部課程
	@Override
	public List<CourseBean> selectAllCourse() {
		Session session = factory.openSession();
		Query<CourseBean> query = session.createQuery("from CourseBean",CourseBean.class);
		return query.list();
	}
	//查詢照片
	@Override
	public List<ImageBean> selectCourseImageById(int courseId) {
		// TODO Auto-generated method stub
		return null;
	}
	//刪除課程
	@Override
	public void deleteCourse(int courseId) {
		Session session = factory.openSession();
		CourseBean resultBean = session.get(CourseBean.class, courseId);
		session.remove(resultBean);
		session.flush();
	}
	
	//更新課程
	@Override
	public void updateCourse(CourseBean cbean) {
		Session session = factory.openSession();
		CourseBean resultBean = session.get(CourseBean.class, cbean.getCourseId());
		resultBean.setCourseName(cbean.getCourseName());
		resultBean.setCoachName(cbean.getCoachName());
		resultBean.setCourseCost(cbean.getCourseCost());
		resultBean.setCourseIntroduce(cbean.getCourseIntroduce());
		session.flush();
	}
	//更新課程照片
	@Override
	public void updateCourseImg(ImageBean ibean) {
		Session session = factory.openSession();
		ImageBean resultBean = session.get(ImageBean.class, ibean.getImageId());
		resultBean.setImageData(ibean.getImageData());
		resultBean.setImageName(ibean.getImageName());
		resultBean.setImgmimeType(ibean.getImgmimeType());
		session.flush();
	}
	

}
