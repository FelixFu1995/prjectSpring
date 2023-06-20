package tw.gym.model.forum;

import java.util.Arrays;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity @Table(name="article")
@Component
public class ArticleBean {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int articleId;   //欄位共10
	private int userId;
	private String articleTitle;
	private String articleContent;
	private byte[] articleImg;    //待修正  byte[]
	private String articleImgMimeType;
	private String articleTime;  //待修正   java.sql.Timestamp
	private String articleType;  //文章種類
//	private int articleLikes;
//	private int articleFollowNum;
//	private int ariticleSaveNum;
//  private int articleReportNum; 
	
	public ArticleBean() {
		super();
	}

	@Override
	public String toString() {
		return "ArticleBean [articleId=" + articleId + ", userId=" + userId + ", articleTitle=" + articleTitle
				+ ", articleContent=" + articleContent + ", articleImg=" + Arrays.toString(articleImg)
				+ ", articleImgMimeType=" + articleImgMimeType + ", articleTime=" + articleTime + ", articleType="
				+ articleType + "]";
	}
	
	
	
	public int getArticleId() {
		return articleId;
	}


	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public byte[] getArticleImg() {
		return articleImg;
	}

	public void setArticleImg(byte[] articleImg) {
		this.articleImg = articleImg;
	}

	public String getArticleImgMimeType() {
		return articleImgMimeType;
	}

	public void setArticleImgMimeType(String articleImgMimeType) {
		this.articleImgMimeType = articleImgMimeType;
	}

	public String getArticleTime() {
		return articleTime;
	}

	public void setArticleTime(String articleTime) {
		this.articleTime = articleTime;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	
	
	
}

