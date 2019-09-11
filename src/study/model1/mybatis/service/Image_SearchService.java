package study.model1.mybatis.service;

import java.util.List;

import study.model1.mybatis.model.Img_Search;



public interface Image_SearchService {
	/**
     * 학과 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	public List<Img_Search.Items> getImageList(Img_Search.Items input) throws Exception;
	
	/*
	 * public List<Img_Search.Items> getImageList_Kor(Img_Search.Items input) throws
	 * Exception;
	 * 
	 * public List<Img_Search.Items> getImageList_Wtf(Img_Search.Items input) throws
	 * Exception;
	 * 
	 * public List<Img_Search.Items> getImageList_Jpn(Img_Search.Items input) throws
	 * Exception;
	 * 
	 * public List<Img_Search.Items> getImageList_Cafe(Img_Search.Items input)
	 * throws Exception;
	 * 
	 * public List<Img_Search.Items> getImageList_Etc(Img_Search.Items input) throws
	 * Exception;
	 * 
	 * public List<Img_Search.Items> getImageList_Chn(Img_Search.Items input) throws
	 * Exception;
	 */
    
    public Img_Search.Items getImageOne(Img_Search.Items input) throws Exception;
    
    public int getImagesCount(Img_Search.Items input) throws Exception;
    
	/* public int getImagesCount_Kor(Img_Search.Items input) throws Exception; */
    
    
}
