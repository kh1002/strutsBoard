package board;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


import java.io.Reader;
import java.io.IOException;
import java.io.File;

import org.apache.commons.io.FileUtils;

public class modifyAction extends ActionSupport {
	//ibatis 선언
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	//자바빈 선언
	private boardVO paramClass;
	private boardVO resultClass;
	
	private int currentPage;
	
	private int no;
	private String subject;
	private String name;
	private String password;
	private String content;
	private String old_file;
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath="C:\\java\\upload\\"; //업로드 경로
	
	//생성자
	public modifyAction() throws IOException {
		
		//ibatis관련 설정
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		
		//파라미터와 리절트 객체 생성
		paramClass = new boardVO();
		resultClass = new boardVO();
		
		//수정할 항목 설정
		paramClass.setNo(getNo());
		paramClass.setSubject(getSubject());
		paramClass.setName(getName());
		paramClass.setPassword(getPassword());
		paramClass.setContent(getContent());
		
		//일단 항목만 수정한다
		sqlMapper.update("updateBoard", paramClass);
		
		//수정할 파일이 업로드 되었다면 파일을 업로드하고 db의 file항목을 수정한다
		if(getUpload() != null) {
			//실제 서버에 저장될 파일 이름과 확장자 설정
			String file_name = "file_" + getNo();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			
			//이전 파일 삭제
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			//새 파일 업로드
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			
			FileUtils.copyFile(getUpload(), destFile);
			
			//파일 정보 파라미터 설정
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "."+file_ext);
			
			//파일 정보 업데이트
			sqlMapper.update("updateFile",paramClass);
			
		}
		
		//수정이 끝나면 view페이지로 이동
		resultClass = (boardVO) sqlMapper.queryForObject("selectOne", getNo());
		
		return SUCCESS;	
		
	}

	public boardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	public boardVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(boardVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	
	

}
