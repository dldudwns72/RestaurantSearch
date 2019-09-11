package study.model1.helper;

public class UploadItem {
	private String fieldName;
	private String orginName;
	private String filePath;
	private String contentType;
	private long fileSize;
	
	
	
	

	public String getFieldName() {
		return fieldName;
	}


	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}


	public String getOrginName() {
		return orginName;
	}


	public void setOrginName(String orginName) {
		this.orginName = orginName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getContentType() {
		return contentType;
	}


	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


	public long getFileSize() {
		return fileSize;
	}


	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}


	@Override
	public String toString() {
		return "UploadItem [fieldName=" + fieldName + ", orginName=" + orginName + ", filePath=" + filePath
				+ ", contentType=" + contentType + ", fileSize=" + fileSize + "]";
	}
	
	
}
