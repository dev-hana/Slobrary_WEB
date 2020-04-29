package bucketConnector;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;

import java.security.InvalidKeyException;

import io.minio.MinioClient;
import io.minio.errors.ErrorResponseException;
import io.minio.errors.InsufficientDataException;
import io.minio.errors.InternalException;
import io.minio.errors.InvalidBucketNameException;
import io.minio.errors.InvalidEndpointException;
import io.minio.errors.InvalidPortException;
import io.minio.errors.InvalidResponseException;
import io.minio.errors.MinioException;
import io.minio.errors.XmlParserException;
import sun.misc.BASE64Encoder;

public class BucketManager {
	
  public boolean fileUpLoader(String remoteName, String localPath) throws NoSuchAlgorithmException, IOException, InvalidKeyException{
	boolean result = false;
	  try {
    	//********보안정보 취급 주의**********
	MinioClient minioClient = new MinioClient("http://slobrary.com", 9000, "slo", "legoslo2020");
      minioClient.putObject("slo", remoteName, localPath, null);
		result = true;
    } catch(MinioException e) {
      System.out.println("Error occurred: " + e);
    }
		return result;
  }
  
public boolean fileDownLoader(String findObjectName) throws InvalidKeyException, ErrorResponseException, IllegalArgumentException, InsufficientDataException, InternalException, InvalidBucketNameException, InvalidResponseException, NoSuchAlgorithmException, XmlParserException, IOException {
	boolean result = false;
	try {
    	//********보안정보 취급 주의**********
		MinioClient minioClient = new MinioClient("http://slobrary.com", 9000, "slo", "legoslo2020");
		InputStream stream = minioClient.getObject("slo", findObjectName);
		writeInputStreamToFile(findObjectName, stream);
		result = true;
	} catch (InvalidEndpointException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (InvalidPortException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return result;
}

public String base64DownLoader(String findObjectName)  throws InvalidKeyException, ErrorResponseException, IllegalArgumentException, InsufficientDataException, InternalException, InvalidBucketNameException, InvalidResponseException, NoSuchAlgorithmException, XmlParserException, IOException {
	String result = "";
	try {
    	//********보안정보 취급 주의**********
		MinioClient minioClient = new MinioClient("http://slobrary.com", 9000, "slo", "legoslo2020");
		InputStream stream = minioClient.getObject("slo", findObjectName);
		BASE64Encoder base64Encoder = new BASE64Encoder();
        ByteArrayOutputStream byteOutStream=new ByteArrayOutputStream();
        int len=0;
        byte[] buf = new byte[1024];
        while((len=stream.read(buf)) != -1){
        	byteOutStream.write(buf, 0, len);
        }
        byte fileArray[]=byteOutStream.toByteArray();
        result = "data:image/jpeg;base64," + base64Encoder.encodeBuffer(fileArray);

	} catch (InvalidEndpointException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (InvalidPortException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println(result);
	return result;
}

  private void writeInputStreamToFile(String fileName, InputStream in) throws IOException {
      OutputStream out = null;
      try {
          out = new FileOutputStream(fileName);

          int read = 0;
          byte[] bytes = new byte[1024];

          while ((read = in.read(bytes)) != -1) {
              out.write(bytes, 0, read);
          }
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          if (out != null) {
              out.close();
          }
          if (in != null) {
              in.close();
          }
      }
  }
}

