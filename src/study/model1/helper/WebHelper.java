package study.model1.helper;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

public class WebHelper {
	private static Logger logger = LoggerFactory.getLogger("WebHelper");

	/** 기본 인코딩 타입 */
	private static final String ENC_TYPE = "UTF-8";

	/** 업로드 된 결과물이 저장될 폴더 */
	public static final String UPLOAD_DIR = "D:/LeeYoungJun/JSP/Upload_result";

	/** 업로드 가능한 최대 용량 */
	public static final int MAX_FILE_SIZE = 32 * 1024 * 1024;
	/** JSP의 request 내장 객체 */
	// --> import javax.servlet.http.HttpServeletRequest;
	private HttpServletRequest request;

	// --> import javax.servlet.http.HttpServeletResponse;
	private HttpServletResponse response;

	/** File정보를 저장하기 위한 컬렉션 */
	private List<UploadItem> fileList;

	/** 그 밖의 일반 데이터를 저장하기 위한 컬렉션 */
	private Map<String, String> paramMap;

	// ------------ 싱글톤 객체 생성 시작 ---------------
	private static WebHelper current;

	// JSP의 내장 객체는 일반 JAVA 클래스가 생성할 수 없다.
	// --> JSP 페이지로부터 request와 response 객체를 전달받아야 한다.
	public static WebHelper getInstance(HttpServletRequest request, HttpServletResponse response) {
		if (current == null) {
			current = new WebHelper();
		}

		// JSP 내장객체를 연결하기 위한 메서드를 호출
		current.init(request, response);
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private WebHelper() {
		super();
	}

	// ----------- 싱글톤 객체 생성 끝 ----------------

	/**
	 * JSP의 주요 내장객체를 멤버변수에 저장
	 * 
	 * @param request
	 * @param response
	 */
	public void init(HttpServletRequest request, HttpServletResponse response) {
		// JSP 내장객체 참조하기 --> getInstance()에 전달된 객체를 받는다.
		this.request = request;
		this.response = response;

		// GET방식인지, POST방식인지 조회한다.
		String methodName = request.getMethod();

		// 현재 URL 획득
		/** getRequestURL() : 요청페이지의 경로를 StringBuffer object 형으로 리턴 */
		String url = request.getRequestURL().toString();
		/** getQueryString() : Get방식으로 넘어온 쿼리 문자열을 구하기 위한 메서드 */
		if (request.getQueryString() != null) {
			url = url + "?" + request.getQueryString();
		}

		logger.debug(String.format("[%s] %s", methodName, url));

		/** 내장객체 초기화 -> utf-8 설정 */
		try {
			this.request.setCharacterEncoding(ENC_TYPE);
			this.response.setCharacterEncoding(ENC_TYPE);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 메시지 표시 후, 페이지를 지정된 곳으로 이동한다.
	 * 
	 * @param url - 이동할 페이지의 URL. Null일 경우 이전 페이지로 이동
	 * @param msg - 화면에 표시할 메시지. Null일 경우 표시 안함
	 */
	public void redirect(String url, String msg) {
		// 획득한 정보를 로그로 표시
		logger.debug(String.format(" --> [redirect] %s >> %s", url, msg));

		// 가상의 View로 만들기 위한 HTML 태그 구성
		String html = "<!doctype html>";
		html += "<html>";
		html += "<head>";
		html += "<meta charset='utf-8'>";

		// 메시지 표시
		if (msg != null) {
			html += "<script type='text/javascript'>alert('" + msg + "');</script>";
		}

		// 페이지 이동
		if (url != null) {
			html += "<meta http-equiv='refresh' content='0; url=" + url + "' />";
		} else {
			html += "<script type='text/javascript'>history.back();</script>";
		}

		html += "</head>";
		html += "<body></body>";
		html += "</html>";

		// 구성된 HTML을 출력한다.
		try {
			PrintWriter out = this.response.getWriter();
			out.print(html);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 파라미터를 전달 받아서 리턴한다.
	 * 
	 * @param fieldName    - 파라미터 이름
	 * @param defaultValue - 값이 없을 경우 사용될 기본값
	 * @return
	 */
	public String getString(String fieldName, String defaultValue) {
		// 리턴을 위한 값을 두 번째 파라미터(기본값)로 설정해 둔다.
		String result = defaultValue;
		// GET,POST 파라미터를 받는다.
		String param = this.request.getParameter(fieldName);

		if (param != null) {
			param = param.trim(); // 앞뒤 공백 제거
			if (!param.equals("")) { // 공백제거 결과가 빈 문자열이 아니라면?
				result = param; // 리턴을 위해서 준비한 변수에 수신한 값을 복사
			}
		}

		logger.debug(String.format("(p) <-- %s = %s", fieldName, result));

		// 값을 리턴. param값이 존재하지 않을 경우 미리 준비한 기본값이 그대로 리턴된다.
		return result;

	}

	/**
	 * 위에 GetString 재정의 파라미터를 전달받아서 리턴, 값이 없을 경우 null을 리턴
	 * 
	 * @param fieldName - 파라미터 이름
	 * @return String
	 */
	public String getString(String fieldName) {
		return this.getString(fieldName, null);
	}

	/**
	 * 파라미터를 전달 받아서 int로 형변환 하여 리턴한다.
	 * 
	 * @param fieldName    - 파라미터 이름
	 * @param defaultValue - 값이 없을 경우 사용될 기본값
	 * @return int
	 */
	public int getInt(String fieldName, int defaultValue) {
		// 리턴을 위한 값을 두 번째 파라미터(기본값)로 설정해 둔다.
		int result = defaultValue; // try구문에서 형변환이 실패하면 이 result가 return

		// getString()메서드를 통해서 파라미터를 문자열 형태로 받는다.
		// 파라미터가 존재하지 않는다면 두 번째로 전달한 값이 리턴된다.
		String param = this.getString(fieldName, null);

		try {
			result = Integer.parseInt(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 파라미터를 전달 받아서 int로 형변환 하여 리턴, 값이 없을 경우 0 리턴
	 * 
	 * @param fieldName - 파라미터 이름
	 * @return
	 */
	public int getInt(String fieldName) {
		return this.getInt(fieldName, 0);
	}

	/**
	 * 배열 형태의 파라미터를 리턴한다.
	 * 
	 * @param fieldName    - 파라미터 이름
	 * @param defaultValue
	 * @return String[]
	 */
	public String[] getStringArray(String fieldName, String[] defaultValue) {
		// 리턴을 위한 값을 두 번째 파라미터(기본값)로 설정
		String[] result = defaultValue;
		// 배열 형태의 GET,POST 파라미터를 받는다.
		String[] param = this.request.getParameterValues(fieldName);

		if (param != null) {
			if (param.length > 0) {
				result = param;
			}
		}

		if (result != null) {
			logger.debug(String.format("(p <-- %s = %s", fieldName, String.join(", ", result)));
		} else {
			logger.debug(String.format("(p <-- %s = null ", fieldName));
		}

		// 값을 리턴. param값이 존재하지 않을 경우 미리 준비한 기본값이 그대로 리턴
		return result;
	}

	/**
	 * 배열 형태의 파라미터를 리턴한다. 값이 없을 경우 null을 리턴
	 * 
	 * @param fieldName - 파라미터 이름
	 * @return String[]
	 */

	public String[] getStringArray(String fieldName) {
		return this.getStringArray(fieldName, null);
	}

	/**
	 * 업로드된 파일의 리스트를 리턴한다.
	 * 
	 * @return List<UploadItem>
	 */
	public List<UploadItem> getFileList() {
		return this.fileList; 
	}

	/**
	 * 업로드시에 함께 전달된 파라미터들의 컬렉션을 리턴한다.
	 * 
	 * @return Map<String,String>
	 */
	public Map<String, String> getParamMap() {
		return this.paramMap;
	}

	/**
	 * Multipart로 전송된 데이터를 판별하여 파일리스트와 텍스트 파라미터를 분류한다. 파일 업로드 절차
	 * 
	 * @throws Exception
	 */

	public void upload() throws Exception {
		// items에 저장 데이터가 분류될 컬렉션들 할당하기
		fileList = new ArrayList<UploadItem>();
		paramMap = new HashMap<String, String>();

		// 업로드가 수행될 폴더의 존재 여부 체크해서 없다면 생성하기
		// --> import java.io.File
		File uploadDirFile = new File(UPLOAD_DIR);
		if (!uploadDirFile.exists()) {
			uploadDirFile.mkdirs();
		}

		// 업로드가 수행될 폴더 연결
		// --> import org.apache.commons.fileupload.disk.DiskFileItemFactory
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(uploadDirFile);

		// 업로드 수행을 위한 객체 생성
		// --> import org.apache.commons.fileupload.servlet.ServeletFileUpload;
		ServletFileUpload upload = new ServletFileUpload(factory);

		// UTF-8 처리 지정
		upload.setHeaderEncoding(ENC_TYPE);

		// 최대 파일 크기
		upload.setSizeMax(MAX_FILE_SIZE);

		// 실제 업로드를 수행하여 전송된 데이터에 대한 컬렉션 객체 추출
		// --> 이 안에 파일과 텍스트 정보가 함께 들어 있기 때문에 반복문을 수행하면서 분류작업 진행
		List<FileItem> items = upload.parseRequest(request);

		/** 업로드 된 파일의 정보 처리 */
		for (int i = 0; i < items.size(); i++) {
			// 전송된 정보 하나를 추출한다.ㅇ
			// import org.apache.commons.fileupload.FileItem
			FileItem f = items.get(i);

			if (f.isFormField()) {
				/** 파일 형식의 데이터가 아닌 경우 --> paramMap에 정보 분류 */
				String key = f.getFieldName();
				String value = f.getString("UTF-8");

				// 이미 동일한 키 값이 map안에 존재한다면 ? --? checkbox
				if (paramMap.containsKey(key)) {
					// 기존의 값 뒤에 콤마(,)를 추가해서 값을 병합한다.
					value = paramMap.get(key) + "," + value;
					paramMap.put(key, value);
				} else {
					paramMap.put(key, value);
				}
			} else {
				/** 파일 형식의 데이터인 경우 --> fileList에 정보 분류 */

				/** 1) 파일의 정보를 추출한다. */
				String fieldName = f.getFieldName();
				String orginName = f.getName();
				String contentType = f.getContentType();
				long fileSize = f.getSize();

				if (fileSize < 1) {
					continue;
				}

				/** 2) 동일한 이름의 파일이 존재하는지를 검사한다 */
				// 파일의 원본에서 확장자만 추출한다
				String ext = orginName.substring(orginName.lastIndexOf("."));

				String fileName = null; // 웹 서버에 저장될 파일 이름
				File uploadFile = null; // 저장될 파일 정보를 담기 위한 File 객체
				String filePath = null; // 저장된 파일의 경로
				int count = 0; // 중복된 파일 수

				while (true) {
					// 저장될 파일 이름 --> 현재시각 + count값 + 확장자
					fileName = String.format("%d%d%s", System.currentTimeMillis(), count, ext);

					// 업로드 파일이 저장될 폴더 + 파일 이름으로 파일객체 생성
					uploadFile = new File(uploadDirFile, fileName);

					// 동일한 이름의 파일이 없다면 반복 중단
					if (!uploadFile.exists()) {
						filePath = uploadFile.getAbsolutePath();
						break;
					}
					// if문을 빠져나올 경우 중복된 이름의 파일이 존재한다는 의미이므로 count를 1증가
					count++;
				} // end while

				f.write(uploadFile);
				f.delete();

				// 최종적으로 생성된 경로에서 업로드 폴더까지의 경로를 제거한다.
				filePath = filePath.replace("\\", "/").replace(UPLOAD_DIR, "");

				/** 3) 파일 정보 분류 처리 */
				// 생성된 정보를 Beans의 객체로 설정해서 컬렉션에 저장
				// --> 이 정보는 추후 파일의 업로드 내역을 DB에 저장할 때 사용된다.
				UploadItem info = new UploadItem();
				info.setFieldName(fieldName);
				info.setOrginName(orginName);
				info.setFilePath(filePath);
				info.setContentType(contentType);
				info.setFileSize(fileSize);

				fileList.add(info);
			} // end if
		} // end for

		// 취득한 정보를 로그에 기록
		for (UploadItem item : fileList) {
			logger.debug(String.format("(f) <-- %s", item.toString()));
		}

		for (String key : paramMap.keySet()) {
			logger.debug(String.format("(p) <-- %s = %s", key, paramMap.get(key)));
		}
	}
	
	/**
	 * Gson 객체를 사용하여 Json 데이터를 출력
	 * @param rt
	 * @param data
	 */
	public void printJson(String rt,Map<String,Object> data) {
	this.response.setContentType("application/json");
	
	Calendar c = Calendar.getInstance();
	String pubDate = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("rt", rt);
	map.put("pubDate", pubDate);
	
	// data가 전달 되었다면 map에 병합
	if(data != null) {
		map.putAll(data);
	}
	
	Gson gson = new Gson();
	String json = gson.toJson(map);
	
	try {
		PrintWriter out = this.response.getWriter();
		out.print(json);
	}catch(Exception e) {
		logger.error(e.getLocalizedMessage());
	}
	}
	
	/**
	 * Gson 객체를 사용하여 Json 형식으로 결과 메시지를 출력한다.
	 * @param data
	 */
	public void printJson(Map<String,Object> data) {
		this.printJson("OK",data);
	}
	
	/**
	 * Gson 객체를 사용하여 Json 형식과 결과 메시지를 출력한다.
	 * @param rt
	 */
	public void printJson(String rt) {
		this.printJson(rt,null);
	}
}
