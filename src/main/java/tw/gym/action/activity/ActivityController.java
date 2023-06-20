package tw.gym.action.activity;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.gym.model.activity.ActivityBean;
import tw.gym.service.activity.ActivityService;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService aService;

	@GetMapping("/insertForm")
	public String showInsertForm() {
		return "activity/InsertActivity";
	}

	@PostMapping("/insert")
	public String insert(@RequestParam("activityCover") MultipartFile activityCover,
			@RequestParam("activityContent") String activityContent, @RequestParam("activityName") String activityName,
			@RequestParam("activityDate") String activityDate,
			@RequestParam("activityLocation") String activityLocation,
			@RequestParam("activityStatus") String activityStatus, Model model) throws IllegalStateException, IOException {
		ActivityBean aBean = new ActivityBean();

		if (!activityCover.isEmpty()) {
			byte[] coverBytes = activityCover.getBytes();
			aBean.setActivityCover(coverBytes);
		}

		aBean.setActivityContent(activityContent);
		aBean.setActivityName(activityName);
		aBean.setActivityDate(activityDate);
		aBean.setActivityLocation(activityLocation);
		aBean.setActivityStatus(activityStatus);

		aService.insert(aBean);
		
		List<ActivityBean> aBeanList = aService.selectAll();
		model.addAttribute("aBeanList", aBeanList);

		return "activity/GetAllActivity";
	}

	@GetMapping("/selectAll")
	public String selectAll(Model model) {
		List<ActivityBean> aBeanList = aService.selectAll();
		model.addAttribute("aBeanList", aBeanList);
		return "activity/GetAllActivity";
	}

	@GetMapping("/selectById/{activityId}")
	public String selectById(@PathVariable int activityId, Model model) {
		ActivityBean aBean = aService.selectById(activityId);
		model.addAttribute("aBean", aBean);
		return "activity/GetActivity";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam int activityId, Model model) {
		aService.delete(activityId);
		
		List<ActivityBean> aBeanList = aService.selectAll();
		model.addAttribute("aBeanList", aBeanList);
		
		return "activity/GetAllActivity";
	}

	@GetMapping("/updateForm")
	public String getActivity(@RequestParam int activityId, Model model) {
		ActivityBean aBean = aService.selectById(activityId);
		model.addAttribute("aBean", aBean);
		return "activity/GetActivity";
	}

	@PostMapping("/update")
	public String update(@RequestParam("activityId") int activityId,
	        @RequestParam("activityCover") MultipartFile activityCover,
	        @RequestParam("activityContent") String activityContent,
	        @RequestParam("activityName") String activityName,
	        @RequestParam("activityDate") String activityDate,
	        @RequestParam("activityLocation") String activityLocation,
	        @RequestParam("activityStatus") String activityStatus, Model model) throws IOException {
	    ActivityBean aBean = aService.selectById(activityId);

	    if (!activityCover.isEmpty()) {
	        byte[] coverBytes = activityCover.getBytes();
	        aBean.setActivityCover(coverBytes);
	    }

	    aBean.setActivityContent(activityContent);
	    aBean.setActivityName(activityName);
	    aBean.setActivityDate(activityDate);
	    aBean.setActivityLocation(activityLocation);
	    aBean.setActivityStatus(activityStatus);

	    aService.update(aBean);

	    List<ActivityBean> aBeanList = aService.selectAll();
		model.addAttribute("aBeanList", aBeanList);
	    
	    return "activity/GetAllActivity";
	}
}
