package study.model1.mybatis.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// lombok 라이브러리는 생성자 getter,setter를 자동인식
/** 테이블 구조에 맞춘 Java Beans 생성 */
@NoArgsConstructor
@AllArgsConstructor
@ToString(includeFieldNames = true)
@Getter@Setter
public class Department {
	private int deptno;
	private String dname;
	private String loc;

	// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
	// SQL의 limit 절에 사용될 변수 
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Department.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Department.listCount = listCount;
	}
}