package study.model1.mybatis.service.Impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import study.model1.mybatis.model.Img_Search;
import study.model1.mybatis.model.Img_Search.Items;
import study.model1.mybatis.service.Image_SearchService;

@Slf4j
public class Image_SearchServiceImpl implements Image_SearchService {

	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
    public Image_SearchServiceImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	@Override
	public List<Items> getImageList(Items input) throws Exception {
		List<Img_Search.Items> result = null;
        
        try {
            result = sqlSession.selectList("Image_SearchMapper.selectList", input);
            
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
	public Items getImageOne(Items input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getImagesCount(Items input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
