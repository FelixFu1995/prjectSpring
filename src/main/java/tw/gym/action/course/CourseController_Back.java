package tw.gym.action.course;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.annotation.MultipartConfig;
import tw.gym.dao.course.courseDAO;
import tw.gym.model.course.CourseBean;
import tw.gym.model.course.ImageBean;
import tw.gym.service.course.courseService;
import tw.gym.service.course.icourseService;
@Controller
@MultipartConfig
public class CourseController_Back{
	
	@Autowired
	@Qualifier("courseService")
	private icourseService cservice;
	
	@GetMapping("/insertCourse.controller")
	public String processMainAction() {
		
		return "course/insertCourse";
	}
	//新增課程
	@PostMapping("/insertCourse.action")
	public String insertCourse(@RequestParam("courseName")String courseName,
			@RequestParam("coachName") String coachName,
			@RequestParam("courseCost") int courseCost,
			@RequestParam("courseIntroduce") String courseIntroduce,
			MultipartHttpServletRequest request,
			Model m
			) throws IOException{
		CourseBean cbean = new CourseBean();
		cbean.setCourseName(courseName);
		cbean.setCoachName(coachName);
		cbean.setCourseCost(courseCost);
		cbean.setCourseIntroduce(courseIntroduce);
		List<MultipartFile> images = request.getFiles("courseImg");
		
		List<ImageBean> imageBeans = new ArrayList<>();
        for (MultipartFile image : images) {
            ImageBean imageBean = new ImageBean();
            imageBean.setImageName(image.getOriginalFilename());
            imageBean.setImageData(image.getBytes());
            imageBean.setImgmimeType(image.getContentType());
            imageBean.setCourse(cbean);
            imageBeans.add(imageBean);
        }
        cbean.setImages(imageBeans);
        cservice.insertCourse(cbean);
        return selectAllCourse(m);
	}
	//查詢所有課程
	@GetMapping("/selectAllCourse.action")
	public String selectAllCourse(Model m) {
		 List<CourseBean> cbeans = cservice.selectAllCourse();
	        m.addAttribute("cbeans",cbeans);
	        return "course/selectAllCourse";
	}
	//刪除課程
	@PostMapping("/deleteCourse.action")
	public String deleteCourse(@RequestParam("courseId") int courseId,Model m) {
		cservice.deleteCourse(courseId);
		return selectAllCourse(m);
	}
	//修改課程
	@PostMapping("/updateCourse.action")
	public String updateCourse(@RequestParam("courseId") int courseId,
			@RequestParam("courseName")String courseName,
			@RequestParam("coachName") String coachName,
			@RequestParam("courseCost") int courseCost,
			@RequestParam("courseIntroduce") String courseIntroduce,
			Model m) {
		CourseBean cbean = new CourseBean();
		cbean.setCourseId(courseId);
		cbean.setCourseName(courseName);
		cbean.setCoachName(coachName);
		cbean.setCourseCost(courseCost);
		cbean.setCourseIntroduce(courseIntroduce);
		cservice.updateCourse(cbean);
		return selectAllCourse(m);
	}
	//修改圖片
	@PostMapping("/updateCourseImg.action")
	public String updateCourseImg(@RequestParam("imageId") int imageId,
			MultipartHttpServletRequest request,Model m) throws IOException {
		MultipartFile image = request.getFile("courseImg");
		 ImageBean imageBean = new ImageBean();
		 imageBean.setImageId(imageId);
         imageBean.setImageName(image.getOriginalFilename());
         imageBean.setImageData(image.getBytes());
         imageBean.setImgmimeType(image.getContentType());
		cservice.updateCourseImg(imageBean);
		return selectAllCourse(m);
	}
	

}
