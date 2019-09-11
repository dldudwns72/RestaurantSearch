package study.model1.mybatis.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString(includeFieldNames = true)
@Getter
@Setter
public class User {
	
	private int userNo;
	private String name;
	private String userId;
	private String userPw;
	private String birthDate;
	private String gender;
	private String tel;
	private String address;
	private String email;
	

	/*
	 * static int offset; static int listCount;
	 * 
	 * public static int getOffset() { return offset; }
	 * 
	 * public static void setOffset(int offset) { Restaurants.offset = offset; }
	 * 
	 * public static int getListCount() { return listCount; }
	 * 
	 * public static void setListCount(int listCount) { Restaurant.listCount =
	 * listCount; }
	 */

}
