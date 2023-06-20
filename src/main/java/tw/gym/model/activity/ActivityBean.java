package tw.gym.model.activity;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "activity")
@Component
public class ActivityBean  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int activityId;
	private String activityName;
	private String activityContent;
	private byte[] activityCover;
	private String activityDate;
	private String activityLocation;
	private String activityStatus;
	
	public ActivityBean() {
	}

	public ActivityBean(int activityId, String activityName, String activityContent, byte[] activityCover,
			String activityDate, String activityLocation, String activityStatus) {
		this.activityId = activityId;
		this.activityName = activityName;
		this.activityContent = activityContent;
		this.activityCover = activityCover;
		this.activityDate = activityDate;
		this.activityLocation = activityLocation;
		this.activityStatus = activityStatus;
	}
	
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getActivityContent() {
		return activityContent;
	}
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	public byte[] getActivityCover() {
		return activityCover;
	}
	public void setActivityCover(byte[] activityCover) {
		this.activityCover = activityCover;
	}
	public String getActivityDate() {
		return activityDate;
	}
	public void setActivityDate(String activityDate) {
		this.activityDate = activityDate;
	}
	public String getActivityLocation() {
		return activityLocation;
	}
	public void setActivityLocation(String activityLocation) {
		this.activityLocation = activityLocation;
	}
	public String getActivityStatus() {
		return activityStatus;
	}
	public void setActivityStatus(String activityStatus) {
		this.activityStatus = activityStatus;
	}


}
	
	
	
	
