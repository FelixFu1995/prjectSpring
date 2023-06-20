package tw.gym.dao.forum;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.model.forum.ArticleBean;


@Repository
@Transactional
public interface IArticleDao {
	   
	//單筆查詢(根據ID)
	public  ArticleBean selectById(int articleId);
	//根據文章標題查詢 (好像沒用>新增之後的預覽頁面)
	public ArticleBean selectByTitle(ArticleBean article);
	//查詢全部資料 >首頁用
	public List<ArticleBean> selectAll();
	//新增單筆
	public ArticleBean insert(ArticleBean article);
	//刪除單筆
	//public void deleteById(ArticleBean article)
	public boolean deleteById(int articleId);
	//修改單筆
//	public ArticleBean update(int articleId, String articleTitle,String articleType, String articleContent );
	
	public ArticleBean update(ArticleBean article);
}
