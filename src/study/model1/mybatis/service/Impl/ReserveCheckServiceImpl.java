package study.model1.mybatis.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import study.model1.mybatis.model.ReserveCheck;
import study.model1.mybatis.service.ReserveCheckService;

@Slf4j
public class ReserveCheckServiceImpl implements ReserveCheckService {
	
	SqlSession sqlSession;

	public ReserveCheckServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	

	@Override
	public List<ReserveCheck> getReserveCheckList(ReserveCheck input) throws Exception {
		List<ReserveCheck> result = null;
        
        try {
            result = sqlSession.selectList("ReserveCheckMapper.selectList", input);
            
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
	public int getReserveCheckCount(ReserveCheck input) throws Exception {
		int result = 0;
		
		 try {
	            result = sqlSession.selectOne("ReserveCheckMapper.selectCount", input);
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
	public int AddReserveCheck(ReserveCheck input) throws Exception {
		
		int result = 0;

		try {
			result = sqlSession.insert("ReserveCheckMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
		return 0;
	}



	@Override
	public int DeleteReserveCheck(ReserveCheck input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ReserveCheckMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
		return 0;
	}
	

}
