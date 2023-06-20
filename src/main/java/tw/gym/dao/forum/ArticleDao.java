package tw.gym.dao.forum;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.model.forum.ArticleBean;


@Repository
@Transactional
public class ArticleDao implements IArticleDao {
	
	@Autowired
	private SessionFactory factory;
	
	//空建構子
	public ArticleDao() {
	}
	
	@Override
	public ArticleBean selectById(int articleId) {
		Session session = factory.getCurrentSession();
		ArticleBean articleBean = session.get(ArticleBean.class, articleId);
		//session.close();
		return articleBean;
	}

	@Override
	public ArticleBean selectByTitle(ArticleBean article) {
		Session session = factory.getCurrentSession();
		ArticleBean articleBean = session.get(ArticleBean.class, article.getArticleId());
		//session.close();
		return articleBean;
	}

	@Override
	public List<ArticleBean> selectAll() {
		Session session = factory.getCurrentSession();
		Query<ArticleBean> query = session.createQuery("from ArticleBean", ArticleBean.class);
		//session.close();
		System.out.println(query.list());
		return query.list();
	}

	@Override
	public ArticleBean insert(ArticleBean article) {
		Session session = factory.openSession();
		ArticleBean articleBean = session.get(ArticleBean.class, article.getArticleId());
		if (articleBean == null) {
			session.persist(article);
			session.flush();
			session.close();
			return article;
		}
		session.close();
		return null;
	}

	@Override
	public boolean deleteById(int articleId) {
		Session session = factory.getCurrentSession();
		ArticleBean articleBean = session.get(ArticleBean.class, articleId);
		if (articleBean != null) {
			session.remove(articleBean);
			session.flush();
		//	session.close();
			return true;
		}
		//session.close();
		return false;
	}

	@Override
	public ArticleBean update(ArticleBean article) {
		Session session = factory.getCurrentSession();
		ArticleBean updateBean = session.get(ArticleBean.class, article.getArticleId());
		if (updateBean != null) {
			updateBean.setArticleTitle(article.getArticleTitle());
			updateBean.setArticleContent(article.getArticleContent());
			updateBean.setArticleImg(article.getArticleImg());
			updateBean.setArticleTime(article.getArticleTime());
			updateBean.setArticleType(article.getArticleType());
			session.flush();
			//session.close();
			return updateBean;
		}
		return null;
		//session.close();
		
	}

}
