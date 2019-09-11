package study.model1.mybatis.service.Impl;
import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import study.model1.mybatis.model.User;
import study.model1.mybatis.service.UserService;

@Slf4j
public class UserServiceImpl implements UserService {

	SqlSession sqlSession;

	public UserServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int addUser(User input) throws Exception {
		// TODO Auto-generated method stub

		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.insertUser", input);

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

		return result;
	}

	@Override
	public int getUserCount(User input) throws Exception {

		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCount", input);
		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;
	}

	@Override
	public int checkTel(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.checkTel", input);
		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;
	}

	@Override
	public int checkEmail(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.checkEmail", input);
		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;
	}

	public String findId(User input) throws Exception {
		String result = null;

		try {
			result = sqlSession.selectOne("UserMapper.findId", input);

		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;

	}
	

	public int editUserPw(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("UserMapper.updatePw", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;
	}

	@Override
	public int getUserCountforUpdatePw(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.countforUpdatePw", input);
		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;
	}

	@Override
	public User login(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.login", input);
			   if (result == null) {
	                throw new NullPointerException("result=null");
	            }
		}  catch (NullPointerException e) {
            sqlSession.rollback();
            log.error(e.getLocalizedMessage());
            throw new Exception("로그인 정보가 일치하는 회원 조회에 실패했습니다.");
        }catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 정보가 일치하는 회원 조회에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

		return result;
	}


}