package study.model1.mybatis.service;

//import java.util.List;

import study.model1.mybatis.model.Ideal;

public interface IdealService {
 
    //public List<Ideal.Items> getIdealList(Ideal.Items input) throws Exception;
   
	public int listIdeal(Ideal input) throws Exception;
	
    public int winIdeal(Ideal input) throws Exception;
    
    public int loseIdeal(Ideal input) throws Exception;

    public int countIdeal(Ideal minput) throws Exception;
    
    public int tempIdeal(Ideal minput) throws Exception;

	
}
