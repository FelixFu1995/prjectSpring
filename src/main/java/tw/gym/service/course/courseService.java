package tw.gym.service.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.course.courseDAO;
import tw.gym.dao.course.icourseDAO;
import tw.gym.model.course.CourseBean;
import tw.gym.model.course.ImageBean;

@Service
@Transactional
public class courseService implements icourseService {
	@Autowired
	@Qualifier("courseDAO")
	private icourseDAO cDao;
	@Override
	public void insertCourse(CourseBean cbean) {
		cDao.insertCourse(cbean);
	}

	@Override
	public CourseBean selectCourseById(int courseId) {
		return cDao.selectCourseById(courseId);
	}

	@Override
	public List<CourseBean> selectAllCourse() {
		return cDao.selectAllCourse();
	}

	@Override
	public List<ImageBean> selectCourseImageById(int courseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCourse(int courseId) {
		cDao.deleteCourse(courseId);

	}

	@Override
	public void updateCourse(CourseBean cbean) {
		cDao.updateCourse(cbean);

	}

	@Override
	public void updateCourseImg(ImageBean ibean) {
		cDao.updateCourseImg(ibean);

	}

}
