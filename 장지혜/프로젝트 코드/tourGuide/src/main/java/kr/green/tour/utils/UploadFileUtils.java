package kr.green.tour.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	/***
	 * 
	 * @param uploadPath: 파일이 업로드될 경로
	 * @param originalName: 실제 파일이름
	 * @param fileData: 실제 파일 데이터
	 * @return 서버에 업로드된 파일 경로와 파일이름이 합쳐진 문자열
	 * @throws Exception
	 */
	/* uploadPath : D:\\JAVA
	 * originalName : a.jpg
	 * D:\\JAVA\\2022\\01\\14\\550e8400-e29b-41d4-a716-446655440000_a.jpg
	 * 리턴값 /2022/01/14/550e8400-e29b-41d4-a716-446655440000_a.jpg
	 */
	public static String uploadFile(String uploadPath, String originalName, byte[] 	
			fileData)throws Exception{
		//UUID(범용 고유 식별자)를 발급,서버에 동일한 이름의 파일이 올라와도 서로 다르게 인식(고유성 부여)
		UUID uid = UUID.randomUUID();
		//파일명 앞에 UUID를 추가하는 코드. UUID_파일명
		String savedName = uid.toString() +"_" + originalName;
		//savedPath는 현재 날짜를 기준으로 된 폴더 경로 문자열
		//2022/01/14
		String savedPath = calcPath(uploadPath);
		//uploadPath와 savedPath로 이루어진 경로에 파일 이름이 savedName인 빈 파일을 생성
		File target = new File(uploadPath + savedPath, savedName);
		//파일을 복사. fileData에 있는 파일을 target에 복사
		FileCopyUtils.copy(fileData, target);
		//savedPath와 savedName을 이용하여 문자열을 만듦
		// /2022/01/14/550e8400-e29b-41d4-a716-446655440000_a.jpg
		String uploadFileName = makeIcon(savedPath, savedName);
		return uploadFileName;
	}
	//uploadPath를 기준으로 현재 날짜 경로를 알려주는 메소드
	//이 때, 현재 날짜 경로에 맞는 폴더가 없으면 폴더를 생성
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		//  \\2022
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		//  \\2022\\01
		String monthPath = yearPath + File.separator 
            + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		//  \\2022\\01\\14
		String datePath = monthPath + File.separator 
            + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//uploadPath에 yearPath 폴더, monthPath 폴더, datePath 폴더를 없으면 만들어줌
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
 
	}                                              //가변인자
	public static void makeDir(String uploadPath, String... paths) {
		if(new File(uploadPath+paths[paths.length-1]).exists())
			return;
		for(String path : paths) {
			//폴더를 경로를 가진 임시 폴더 생성
			File dirPath = new File(uploadPath + path);
			//해당 경로에 임시폴더와 같은 폴더가 없으면
			if( !dirPath.exists())
				//해당 폴더를 실제로 만듦
				dirPath.mkdir();
		}
	}
	public static String makeIcon(String path, String fileName)
        	throws Exception{
		String iconName = path + File.separator + fileName;
		return iconName.replace(File.separatorChar, '/');
	}
}
