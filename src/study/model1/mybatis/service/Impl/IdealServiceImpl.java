package study.model1.mybatis.service.Impl;

//import java.util.List;
import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import study.model1.mybatis.model.Ideal;
import study.model1.mybatis.service.IdealService;

@Slf4j
public class IdealServiceImpl implements IdealService {


	   SqlSession sqlSession;

	   /** 생성자를 통한 객체 생성 */
	    public IdealServiceImpl(SqlSession sqlSession) {
	        this.sqlSession = sqlSession;
	    }

	    
	/*
	 * @Override public int List<Ideal.Items> getIdealList(Ideal.Items input) throws
	 * Exception { List<Ideal.Items> result = null;
	 * 
	 * try { result = sqlSession.selectOne("IdealMapper.selectlist", input);
	 * 
	 * if (result == 0) { throw new NullPointerException("result=null"); } } catch
	 * (NullPointerException e) { sqlSession.rollback(); //
	 * log.error(e.getLocalizedMessage()); throw new Exception("조회된 데이터가 없습니다."); }
	 * catch (Exception e) { sqlSession.rollback(); //
	 * log.error(e.getLocalizedMessage()); throw new Exception("데이터 조회에 실패했습니다."); }
	 * finally { sqlSession.commit(); }
	 * 
	 * return result; }
	 */


	    @Override
		   public int listIdeal(Ideal input) throws Exception {
		       int result = 0;

		       try {
		           result = sqlSession.selectOne("IdealMapper.list", input);

		           if (result == 0) {
		               throw new NullPointerException("result=null");
		           }
		       } catch (NullPointerException e) {
		           sqlSession.rollback();
		           log.error(e.getLocalizedMessage());
		           throw new Exception("조회된 데이터가 없습니다.");
		       } catch (Exception e) {
		           sqlSession.rollback();
		           log.error(e.getLocalizedMessage());
		           throw new Exception("데이터 조회에 실패했습니다.");
		       } finally {
		           sqlSession.commit();
		       }

		       return result;
		   }
		   

	   @Override
	   public int winIdeal(Ideal input) throws Exception {
	       int result = 0;

	       try {
	           result = sqlSession.update("IdealMapper.win", input);

	           if (result == 0) {
	               throw new NullPointerException("result=null");
	           }
	       } catch (NullPointerException e) {
	           sqlSession.rollback();
	           log.error(e.getLocalizedMessage());
	           throw new Exception("조회된 데이터가 없습니다.");
	       } catch (Exception e) {
	           sqlSession.rollback();
	           log.error(e.getLocalizedMessage());
	           throw new Exception("데이터 조회에 실패했습니다.");
	       } finally {
	           sqlSession.commit();
	       }

	       return result;
	   }
	   
	   
	   @Override
	   public int loseIdeal(Ideal input) throws Exception {
	       int result = 0;

	       try {
	           result = sqlSession.update("IdealMapper.lose", input);

	           if (result == 0) {
	               throw new NullPointerException("result=null");
	           }
	       } catch (NullPointerException e) {
	           sqlSession.rollback();
	          // log.error(e.getLocalizedMessage());
	           throw new Exception("조회된 데이터가 없습니다.");
	       } catch (Exception e) {
	           sqlSession.rollback();
	          // log.error(e.getLocalizedMessage());
	           throw new Exception("데이터 조회에 실패했습니다.");
	       } finally {
	           sqlSession.commit();
	       }

	       return result;
	   }
	   

	    
	   @Override
	   public int countIdeal(Ideal input) throws Exception {
	      int result = 0;

	       try {
	           result = sqlSession.update("IdealMapper.count", input);

	           if (result == 0) {
	               throw new NullPointerException("result=null");
	           }
	       } catch (NullPointerException e) {
	           sqlSession.rollback();
	         //  log.error(e.getLocalizedMessage());
	           throw new Exception("조회된 데이터가 없습니다.");
	       } catch (Exception e) {
	           sqlSession.rollback();
	          // log.error(e.getLocalizedMessage());
	           throw new Exception("데이터 조회에 실패했습니다.");
	       } finally {
	           sqlSession.commit();
	       }

	       return result;
	   }
	   

	  @Override
	   public int tempIdeal(Ideal input) throws Exception {
	       int result = 0;

	       try {
	           result = sqlSession.update("IdealMapper.temp", input);

	           if (result == 0) {
	               throw new NullPointerException("result=null");
	           }
	       } catch (NullPointerException e) {
	           sqlSession.rollback();
	          // log.error(e.getLocalizedMessage());
	           throw new Exception("조회된 데이터가 없습니다.");
	       } catch (Exception e) {
	           sqlSession.rollback();
	          // log.error(e.getLocalizedMessage());
	           throw new Exception("데이터 조회에 실패했습니다.");
	       } finally {
	           sqlSession.commit();
	       }

	       return result;
	   }
	   
}
