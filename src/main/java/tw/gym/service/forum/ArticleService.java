package tw.gym.service.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.forum.IArticleDao;
import tw.gym.model.forum.ArticleBean;



@Service
@Transactional
public class ArticleService implements IArticleService {
	
	@Autowired
	//宣告介面的Dao
	private IArticleDao articleDao ;

	
	@Override
	public ArticleBean selectById(int articleId) {
		return articleDao.selectById(articleId);
	}

	@Override
	public ArticleBean selectByTitle(ArticleBean article) {
		return articleDao.selectByTitle(article);
	}

	@Override
	public List<ArticleBean> selectAll() {
	//List<ArticleBean> articleList = articleDao.selectAll();
		//return articleList;
		return articleDao.selectAll();
	}

	@Override
	public ArticleBean insert(ArticleBean article) {
		return articleDao.insert(article);
	}

	@Override
	public boolean deleteById(int articleId) {
		return articleDao.deleteById(articleId);
	}

//	@Override
//	public ArticleBean update(int articleId, String articleTitle,String articleType, String articleContent ) {
//		return articleDao.update(articleId,  articleTitle, articleType,  articleContent );
//	}
	
	@Override
	public ArticleBean update(ArticleBean article) {
		return articleDao.update(article);
	}


//	@Override
//	public void saveArticle(String fileName, byte[] b) {
//		
//	}

}
