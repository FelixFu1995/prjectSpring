package tw.gym.action.forum;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.annotation.MultipartConfig;
import tw.gym.model.forum.ArticleBean;
import tw.gym.service.forum.IArticleService;

@Controller
@MultipartConfig
public class ArticleController {
	
	@Autowired
	private IArticleService articleService;
	

	
//	@GetMapping("/insertArticle")
	@PostMapping("/insertArticle")
	public String insertArticle(@RequestParam("articleTitle")String articleTitle,@RequestParam("articleContent")String articleContent,
			@RequestParam("articleType")String articleType,
			@RequestParam("articleImg") MultipartFile file,
			Model model) throws IOException {

		ArticleBean articleBean= new ArticleBean();
		
		// Set article time
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String articleTime = now.format(formatter);
		articleBean.setArticleTime(articleTime);

		 if (!file.isEmpty()) {
	            byte[] imageData = file.getBytes();
	            String mimeType = file.getContentType();
	            articleBean.setArticleImg(imageData);
	            articleBean.setArticleImgMimeType(mimeType);
	        }
		articleBean.setUserId(1);
		articleBean.setArticleTitle(articleTitle);
		articleBean.setArticleContent(articleContent);
		articleBean.setArticleType(articleType);
		articleService.insert(articleBean);
		ArticleBean articleBean2 = articleService.selectByTitle(articleBean);
		model.addAttribute("articleBean2", articleBean2);
		return "forum/insertArticle";
	}
	
	
	@GetMapping("/getAllArticle")
//	@PostMapping("/getAllArticle")
	public String getAllarticle(Model model) {
		//List<ArticleBean> articleListBean = articleService.selectAll();
		model.addAttribute("articleListBean", articleService.selectAll());
		return "forum/getAllArticle";
	}
	
	
	@GetMapping("/selectArticleById")
//	@PostMapping("/selectArticleById")
	public String selectArticleById(@RequestParam("articleId")int articleId,Model model) {
		ArticleBean articleBean = new ArticleBean();
        articleBean.setUserId(1);
		articleBean = articleService.selectById(articleId);
		model.addAttribute("articleBean", articleBean);
		return "forum/selectArticleById";
	}
	
	@GetMapping("/deleteArticle")
//	@PostMapping("/deleteArticle")
	public String deleteArticle(@RequestParam("articleId")String articleId,Model model) {
		ArticleBean articleBean = new ArticleBean();
		articleBean.setArticleId(Integer.parseInt(articleId));
		articleService.deleteById(Integer.parseInt(articleId));
        articleBean.setUserId(1);
		articleBean = articleService.selectById(Integer.parseInt(articleId));
		model.addAttribute("articleBean", articleBean);
		return "forum/deleteArticle";
	}
	
//	@GetMapping("/updateArticle")
	@PostMapping("/updateArticle")
	public String updateArticle(@RequestParam("articleId")int articleId,@RequestParam("articleTitle")String articleTitle,@RequestParam("articleContent")String articleContent,
			@RequestParam("articleTime")String articleTime,
			@RequestParam("articleType")String articleType,
			@RequestParam("articleImg") MultipartFile file,
			Model model) throws IOException {
		ArticleBean articleBean = new ArticleBean();
		
		 if (!file.isEmpty()) {
	            byte[] imageData = file.getBytes();
	            String mimeType = file.getContentType();
	            articleBean.setArticleImg(imageData);
	            articleBean.setArticleImgMimeType(mimeType);
	        }

		articleBean.setUserId(1);
		articleBean.setArticleId(articleId);
		articleBean.setArticleTitle(articleTitle);
		articleBean.setArticleContent(articleContent);
	    articleBean.setArticleTime(articleTime);
		articleBean.setArticleType(articleType);
		articleService.update(articleBean);
		ArticleBean beanArticleId = articleService.selectById(articleId);
		model.addAttribute("beanArticleId", beanArticleId);
		return "forum/updateArticle";
	}
	
//	@GetMapping("/articleUpdateResult")
	@PostMapping("/articleUpdateResult")
	public String articleUpdateResult(@RequestParam("articleId")int articleId,@RequestParam("articleTitle")String articleTitle,@RequestParam("articleContent")String articleContent,
			@RequestParam("articleTime")String articleTime,@RequestParam("articleType")String articleType,@RequestParam("articleImg") MultipartFile file,Model model) throws IOException {
		ArticleBean articleBean = new ArticleBean();

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String articleTime2 = now.format(formatter);
		
		if (!file.isEmpty()) {
	            byte[] imageData = file.getBytes();
	            String mimeType = file.getContentType();
	            articleBean.setArticleImg(imageData);
	            articleBean.setArticleImgMimeType(mimeType);
	        }
		
		articleBean.setUserId(1);
		articleBean.setArticleId(articleId);
		articleBean.setArticleTitle(articleTitle);
		articleBean.setArticleContent(articleContent);
		articleBean.setArticleTime(articleTime2);
		articleBean.setArticleType(articleType);
		articleService.update(articleBean);
		articleBean = articleService.selectById(articleId);
		model.addAttribute("articleBean", articleBean);
		return "forum/articleUpdateResult";
	}
	
	@GetMapping("/articleSelectPage")
//	@PostMapping("/articleSelectPage")
	public String articleSelectPage() {
		return "forum/articleSelectPage";
	}
	
	@GetMapping("/articleInsertPage")
//	@PostMapping("/articleInsertPage")
	public String articleInsertPage() {
		return "forum/articleInsertPage";
	}
	
	
	
}
