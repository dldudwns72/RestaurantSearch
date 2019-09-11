package study.model1.retrofit.service;


import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Query;
import study.model1.helper.RetrofitHelper;
import study.model1.retrofit.model.Restaurants;

public interface RestaurantService {
	

	/*
	 * String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text + "&display=" + display + "&";
	 */
	
	public static final Retrofit retrofit = RetrofitHelper.getInstance().getRetrofit("https://openapi.naver.com");
	
	//@GET("/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=c812506409f7845fc4a00583c587a69b")
	/*
	 * @GET("/v1/search/local.json?query=\" + text + \"&display=\" + display + \"&\""
	 * )
	 * 
	 * Call<Restaurants> getRestaurantsList(@Query("text") String
	 * text,@Query("display") int display);
	 */
	
	@Headers({"X-Naver-Client-Id: zeIUt33syZHSFsF7Pgyt",
		      "X-Naver-Client-Secret: yLWDqhag3h"})
	//@GET("/v1/search/local.json?query = text&display=display")
	@GET("/v1/search/local.json")
	 
	 Call<Restaurants> getRestaurantsList(@Query("query") String query,
	 @Query("display") int display);
	 
	

	 
}
