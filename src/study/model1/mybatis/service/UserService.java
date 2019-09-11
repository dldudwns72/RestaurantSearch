package study.model1.mybatis.service;

import study.model1.mybatis.model.User;

public interface UserService {
	
	/**
	 * 유저 데이터 등록하기
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @return 
	 * @throws Exception
	 */
	public int addUser (User input) throws Exception;
	
	public int getUserCount(User input) throws Exception;
	
	public int checkTel(User input) throws Exception;
	
	public int checkEmail(User input) throws Exception;
	
	/**
	 * 아이디 찾기
	 * @param User 조회할 아이디를 담고있는 Beans
	 * @return 조회된 아이디가 저장된 Beans
	 * @throws Exception
	 */
	public String findId (User input) throws Exception;
	
	/**
	 * 비밀번호 변경
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editUserPw (User input) throws Exception;
	
	/**
	 * 비밀번호 변경을 위한 아이디 조회
	 * @param input
	 * @return User 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int getUserCountforUpdatePw (User input) throws Exception;
	
	/**
	 * 로그인을 위한 아이디 조회
	 * @param User 정보를 담고 있는 Beans
	 * @return
	 * @throws Exception
	 */
	public User login(User input) throws Exception;
	

}
