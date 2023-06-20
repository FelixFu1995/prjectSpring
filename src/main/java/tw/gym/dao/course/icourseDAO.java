package tw.gym.dao.course;

import java.util.List;

import tw.gym.model.course.CourseBean;
import tw.gym.model.course.ImageBean;

public interface icourseDAO {
	public void insertCourse(CourseBean cbean);
	public CourseBean selectCourseById(int courseId);
	public List<CourseBean> selectAllCourse();
	public List<ImageBean> selectCourseImageById(int courseId);
	public void deleteCourse(int courseId);
	public void updateCourse(CourseBean cbean);
	public void updateCourseImg(ImageBean ibean);
}
