package study.model1.mybatis.model;

import com.google.gson.annotations.SerializedName;

public class Ideal {


	   // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
	   // SQL의 limit 절에 사용될 변수
	   private static int offset;
	   private static int listCount;

	   public static int getOffset() {
	      return offset;
	   }

	   public static void setOffset(int offset) {
	      Ideal.offset = offset;
	   }

	   public static int getListCount() {
	      return listCount;
	   }

	   public static void setListCount(int listCount) {
	      Ideal.listCount = listCount;
	   }
	   
	   //public static class Items {
		
	   @SerializedName("num")      public int num;
	   @SerializedName("name")      public String name ;
	   @SerializedName("win")      public int win;
	   @SerializedName("lose")      public int lose;
	   @SerializedName("userNo")      public int userNo;
	   @SerializedName("gamecount")      public int gamecount;
	   @SerializedName("g1")      public int g1;
	   @SerializedName("g2")      public int g2;
	   @SerializedName("g3")      public int g3;
	   @SerializedName("g4")      public int g4;
	   @SerializedName("g5")      public int g5;
	   @SerializedName("g6")      public int g6;
	   @SerializedName("g7")      public int g7;
	   @SerializedName("g8")      public int g8;
	   @SerializedName("g9")      public int g9;
	   @SerializedName("g10")      public int g10;
	   @SerializedName("g11")      public int g11;
	   @SerializedName("g12")      public int g12;
	   @SerializedName("g13")      public int g13;
	   @SerializedName("g14")      public int g14;
	   @SerializedName("g15")      public int g15;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGamecount() {
		return gamecount;
	}

	public void setGamecount(int gamecount) {
		this.gamecount = gamecount;
	}

	public int getG1() {
		return g1;
	}

	public void setG1(int g1) {
		this.g1 = g1;
	}

	public int getG2() {
		return g2;
	}

	public void setG2(int g2) {
		this.g2 = g2;
	}

	public int getG3() {
		return g3;
	}

	public void setG3(int g3) {
		this.g3 = g3;
	}

	public int getG4() {
		return g4;
	}

	public void setG4(int g4) {
		this.g4 = g4;
	}

	public int getG5() {
		return g5;
	}

	public void setG5(int g5) {
		this.g5 = g5;
	}

	public int getG6() {
		return g6;
	}

	public void setG6(int g6) {
		this.g6 = g6;
	}

	public int getG7() {
		return g7;
	}

	public void setG7(int g7) {
		this.g7 = g7;
	}

	public int getG8() {
		return g8;
	}

	public void setG8(int g8) {
		this.g8 = g8;
	}

	public int getG9() {
		return g9;
	}

	public void setG9(int g9) {
		this.g9 = g9;
	}

	public int getG10() {
		return g10;
	}

	public void setG10(int g10) {
		this.g10 = g10;
	}

	public int getG11() {
		return g11;
	}

	public void setG11(int g11) {
		this.g11 = g11;
	}

	public int getG12() {
		return g12;
	}

	public void setG12(int g12) {
		this.g12 = g12;
	}

	public int getG13() {
		return g13;
	}

	public void setG13(int g13) {
		this.g13 = g13;
	}

	public int getG14() {
		return g14;
	}

	public void setG14(int g14) {
		this.g14 = g14;
	}

	public int getG15() {
		return g15;
	}

	public void setG15(int g15) {
		this.g15 = g15;
	}

	@Override
	public String toString() {
		return "Ideal [num=" + num + ", name=" + name + ", win=" + win + ", lose=" + lose + ", userNo=" + userNo
				+ ", gamecount=" + gamecount + ", g1=" + g1 + ", g2=" + g2 + ", g3=" + g3 + ", g4=" + g4 + ", g5=" + g5
				+ ", g6=" + g6 + ", g7=" + g7 + ", g8=" + g8 + ", g9=" + g9 + ", g10=" + g10 + ", g11=" + g11 + ", g12="
				+ g12 + ", g13=" + g13 + ", g14=" + g14 + ", g15=" + g15 + "]";
	}
	
	   
	   
	   
	   
//}
	   
}
