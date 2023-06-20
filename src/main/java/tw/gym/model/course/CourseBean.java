package tw.gym.model.course;

import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "course")
@Component
public class CourseBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "courseId")
	private Integer courseId;
	@Column(name = "courseName")
	private String courseName;
	@Column(name = "coachName")
	private String coachName;
	@Column(name = "courseIntroduce")
	private String courseIntroduce;
	@Column(name = "courseCost")
	private Integer courseCost;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course", cascade = CascadeType.ALL)
	private List<ImageBean> images;

	public CourseBean() {
	}

	

	public CourseBean(String courseName, String coachName, String courseIntroduce, Integer courseCost,
			List<ImageBean> images) {
		super();
		this.courseName = courseName;
		this.coachName = coachName;
		this.courseIntroduce = courseIntroduce;
		this.courseCost = courseCost;
		this.images = images;
	}



	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public String getCourseIntroduce() {
		return courseIntroduce;
	}

	public void setCourseIntroduce(String courseIntroduce) {
		this.courseIntroduce = courseIntroduce;
	}

	public Integer getCourseCost() {
		return courseCost;
	}

	public void setCourseCost(Integer courseCost) {
		this.courseCost = courseCost;
	}

	public List<ImageBean> getImages() {
		return images;
	}

	public void setImages(List<ImageBean> images) {
		this.images = images;
	}

}