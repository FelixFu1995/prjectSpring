package tw.gym.model.course;


import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="corder")
@Component
public class CorderBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="corderId")
	private Integer corderId;
	@Column(name="userId")
	private Integer userId;
	@Column(name="courseId")
	private Integer courseId;
	@Column(name="corderPayment")
	private String corderPayment;
	@Column(name="corderTime",insertable = false,updatable = false)
	private String corderTime;
	@Column(name="corderCost")
	private Integer corderCost;
	
	public Integer getCorderId() {
		return corderId;
	}
	public void setCorderId(Integer corderId) {
		this.corderId = corderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getCorderPayment() {
		return corderPayment;
	}
	public void setCorderPayment(String corderPayment) {
		this.corderPayment = corderPayment;
	}
	public String getCorderTime() {
		return corderTime;
	}
	public void setCorderTime(String corderTime) {
		this.corderTime = corderTime;
	}
	public Integer getCorderCost() {
		return corderCost;
	}
	public void setCorderCost(Integer corderCost) {
		this.corderCost = corderCost;
	}
	


}
