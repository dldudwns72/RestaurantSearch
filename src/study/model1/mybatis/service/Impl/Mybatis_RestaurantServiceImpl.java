package study.model1.mybatis.service.Impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import study.model1.mybatis.model.Restaurants;
import study.model1.mybatis.model.Restaurants.Items;
import study.model1.mybatis.service.Mybatis_RestaurantService;

@Slf4j
public class Mybatis_RestaurantServiceImpl implements Mybatis_RestaurantService {

	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
    public Mybatis_RestaurantServiceImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    @Override
	public List<Restaurants.Items> getRestaurantList(Restaurants.Items input) throws Exception {
		List<Restaurants.Items> result = null;
        
        try {
            result = sqlSession.selectList("RestaurantsMapper.selectList", input);
            
            if (result == null) {
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
	public List<Restaurants.Items> getRestaurantList_Kor(Restaurants.Items input) throws Exception {
		List<Restaurants.Items> result = null;
        
        try {
            result = sqlSession.selectList("RestaurantsMapper.selectList_kor", input);
            
            if (result == null) {
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
	public List<Restaurants.Items> getRestaurantList_Chn(Restaurants.Items input) throws Exception {
		List<Restaurants.Items> result = null;
        
        try {
            result = sqlSession.selectList("RestaurantsMapper.selectList_Chn", input);
            
            if (result == null) {
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
	public List<Items> getRestaurantList_Wtf(Items input) throws Exception {
		List<Restaurants.Items> result = null;
        
        try {
            result = sqlSession.selectList("RestaurantsMapper.selectList_Wtf", input);
            
            if (result == null) {
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
	public List<Items> getRestaurantList_Jpn(Items input) throws Exception {
		List<Restaurants.Items> result = null;
        
        try {
            result = sqlSession.selectList("RestaurantsMapper.selectList_Jpn", input);
            
            if (result == null) {
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
	public List<Items> getRestaurantList_Cafe(Items input) throws Exception {
		List<Restaurants.Items> result = null;
        
        try {
            result = sqlSession.selectList("RestaurantsMapper.selectList_Cafe", input);
            
            if (result == null) {
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
	public List<Items> getRestaurantList_Etc(Items input) throws Exception {
		List<Restaurants.Items> result = null;
		try {
            result = sqlSession.selectList("RestaurantsMapper.selectList_Etc", input);
            
            if (result == null) {
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
	public int getRestaurantsCount(Items input) throws Exception {
		int result = 0;
		
		 try {
	            result = sqlSession.selectOne("RestaurantsMapper.selectCount", input);
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
	public Restaurants.Items getRestaurantOne(Restaurants.Items input) throws Exception {
		Restaurants.Items result = null;
		try {
            result = sqlSession.selectOne("RestaurantsMapper.selectItem", input);
            
            if (result == null) {
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
	public int getRestaurantsCount_Kor(Items input) throws Exception {
		int result = 0;
		
		 try {
	            result = sqlSession.selectOne("RestaurantsMapper.selectCount_Kor", input);
	        } catch (Exception e) {
	            sqlSession.rollback();
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        } finally {
	            sqlSession.commit();
	        }
	        
	        return result;
	}
	
}
