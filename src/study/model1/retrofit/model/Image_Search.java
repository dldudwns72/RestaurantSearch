package study.model1.retrofit.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

// My_Batis 연결을 위한 Restaurant 빈즈
public class Image_Search {

	

	// 전체 건수
	@SerializedName("total")
	public int total;
	@SerializedName("start")
	public int start;
	// 검색되는 개수
	@SerializedName("display")
	public int display;

	
	
	

	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}



	public int getDisplay() {
		return display;
	}



	public void setDisplay(int display) {
		this.display = display;
	}



	public List<Items> getItems() {
		return items;
	}



	public void setItems(List<Items> items) {
		this.items = items;
	}


	@SerializedName("items")
	public List<Items> items;
	
	public static class Items {
		
		@SerializedName("title")
		public String title;
		@SerializedName("link")
		public String link;
		@SerializedName("thumbnail")
		public String thumbnail;
		@SerializedName("sizeheight")
		public String sizeheight;
		@SerializedName("sizewidth")
		public String sizewidth;
		
		// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
		// SQL의 limit 절에 사용될 변수
		private static int offset;
		private static int listCount;

		public static int getOffset() {
			return offset;
		}

		public static void setOffset(int offset) {
			Image_Search.Items.offset = offset;
		}

		public static int getListCount() {
			return listCount;
		}

		public static void setListCount(int listCount) {
			Image_Search.Items.listCount = listCount;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getLink() {
			return link;
		}

		public void setLink(String link) {
			this.link = link;
		}

		public String getThumbnail() {
			return thumbnail;
		}

		public void setThumbnail(String thumbnail) {
			this.thumbnail = thumbnail;
		}

		public String getSizeheight() {
			return sizeheight;
		}

		public void setSizeheight(String sizeheight) {
			this.sizeheight = sizeheight;
		}

		public String getSizewidth() {
			return sizewidth;
		}

		public void setSizewidth(String sizewidth) {
			this.sizewidth = sizewidth;
		}

		
	}

}
